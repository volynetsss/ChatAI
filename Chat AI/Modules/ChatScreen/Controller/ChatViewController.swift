import Foundation
import UIKit
import SnapKit

protocol ChatViewControllerDelegate : AnyObject {
    func didChatCreated(chat: Chat)
}

class ChatViewController: UIViewController {
    private let mainView = ChatView()
    weak var delegate: ChatViewControllerDelegate?
    
    var chat: Chat?
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mainView.handle(chat: chat)
    }
    
    private func initViewController() {
        initTableView()
        initActions()
        initTextView()
    }
}

//MARK: - init items
extension ChatViewController {
    private func initTableView() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.registerReusableCell(ChatTableViewCell.self)
    }

    private func initTextView() {
        mainView.messageField.delegate = self
    }
    
    private func initActions() {
        mainView.backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        mainView.sendButton.addTarget(self, action: #selector(didTapSendButton), for: .touchUpInside)
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }
}

//MARK: - actions
extension ChatViewController {
    @objc
    private func didTapBackButton() {
        goBackChatsViewController()
    }
    
    @objc
    private func didTapSendButton() {
        sendMessage()
    }
    
    @objc
    private func hideKeyboard() {
        self.view.endEditing(true)
    }
}

//MARK: - functionality to return to the root controller
extension ChatViewController {
    private func goBackChatsViewController() {
        mainView.messageField.resignFirstResponder()
        
        if let chat = chat {
            if !chat.messages.isEmpty {
                delegate?.didChatCreated(chat: chat)
            }
        } else {
            chat = nil
        }
        
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - setting textView
extension ChatViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        mainView.messageFieldPlaceholder.isHidden = true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if let isMessageFieldEmpty = textView.text?.isEmpty {
            if isMessageFieldEmpty {
                mainView.messageFieldPlaceholder.isHidden = false
            }
        }
    }
}

//MARK: - functionality of sending messages
extension ChatViewController {
    private func sendMessage(message: String? = nil) {
        if let message = message {
            chat?.send(text: message, isIncoming: false)
            mainView.tableView.insertRows(at: [IndexPath(item: (chat?.messages.count ?? 0)-1, section: 0)], with: .right)
            return
        }
        
        let isValide = performValidationMessage(message: mainView.messageField.text.trim())
        
        if isValide {
            chat?.send(text: mainView.messageField.text.trim(), isIncoming: false)
            mainView.tableView.insertRows(at: [IndexPath(item: (chat?.messages.count ?? 0)-1, section: 0)], with: .right)
            
            mainView.messageField.text = ""
            mainView.messageField.resignFirstResponder()
        }
    }
}

//MARK: - setting tableView
extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chat?.messages.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ChatTableViewCell = tableView.dequeueReusableCell(for: indexPath) else {
            return UITableViewCell()
        }
        
        let rowData = chat?.messages[indexPath.row]
        cell.handleData(messages: rowData)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        let configuration = UIContextMenuConfiguration(
            identifier: indexPath as NSIndexPath,
            previewProvider: nil) { _ in
                
                let replyAction = UIAction(
                    title: LocalizationKeys.contextMenuActionReanswer.rawValue.localized,
                    image: UIImage(systemName: "repeat")
                ) { _ in
                    self.sendMessage(message: self.chat?.messages[indexPath.row].content ?? "")
                }
                
                let copyAction = UIAction(
                    title: LocalizationKeys.contextMenuActionCopy.rawValue.localized,
                    image: UIImage(systemName: "doc.on.doc")
                ) { _ in
                    UIPasteboard.general.string = self.chat?.messages[indexPath.row].content ?? ""
                }
                
                let menu = UIMenu(title: "", image: nil, children: [replyAction, copyAction])
                return menu
                
            }
        
        return configuration
    }
    
    func tableView(_ tableView: UITableView, previewForDismissingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        guard let indexPath = configuration.identifier as? IndexPath,
              let cell = tableView.cellForRow(at: indexPath) as? ChatTableViewCell else {
            return nil
        }
        
        let parameters = UIPreviewParameters()
        
        parameters.backgroundColor = .clear
        parameters.visiblePath = cell.bezierpath
        
        return UITargetedPreview(view: cell.bubbleView, parameters: parameters)
    }
    
    func tableView(_ tableView: UITableView, previewForHighlightingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        guard
            let indexPath = configuration.identifier as? IndexPath,
            let cell = tableView.cellForRow(at: indexPath) as? ChatTableViewCell
        else {
            return nil
        }
        
        let parameters = UIPreviewParameters()
        
        parameters.backgroundColor = .clear
        parameters.visiblePath = cell.bezierpath
        
        return UITargetedPreview(view: cell.bubbleView, parameters: parameters)
    }
}


extension ChatViewController {
    private func performValidationMessage(message: String) -> Bool {
        do {
            try Validation.validateMessage(message: message)
        } catch let error as ValidationError {
            let alert = ErrorAlert.showAlertError(title: LocalizationKeys.errorTitle.rawValue.localized, message: error.localizedDescription)
            present(alert, animated: true, completion: nil)
            return false
        } catch {
            print("An unexcepted error occured")
        }
        return true
    }
}
