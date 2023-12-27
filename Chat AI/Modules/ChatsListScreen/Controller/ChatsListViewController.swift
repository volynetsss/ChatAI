import Foundation
import UIKit

class ChatsListViewController: UIViewController, Reusable {
    private let mainView = ChatsListView()
    
    var filteredChats: [Chat] = []
    var allChats: [Chat] = []
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        deselectRow(animated: animated)
        
        DispatchQueue.main.async { [self] in
            mainView.tableView.reloadData()
        }
    }
    
    private func initViewController() {
        initTableView()
        initSearchField()
        initButton()
    }
}

//MARK: - init items
extension ChatsListViewController {
    private func initTableView() {
        filteredChats = allChats
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.registerReusableCell(ChatsTableViewCell.self)
    }
    
    private func initSearchField() {
        mainView.searchField.delegate = self
    }
    
    private func initButton() {
        mainView.addNewChatButton.addTarget(self, action: #selector(didTapAddChatButton), for: .touchUpInside)
    }
}

//MARK: - navigation
extension ChatsListViewController {
    private func openChatViewController(id: UUID = UUID(), chatName: String = "") {
        let chatViewController = ChatViewController()
        if let chat = allChats.filter({ $0.id == id }).first {
            chatViewController.chat = chat

        } else {
            chatViewController.chat = Chat(id: id, chatName: chatName)
        }

        chatViewController.delegate = self
        navigationController?.pushViewController(chatViewController, animated: true)
    }
}

//MARK: - actions
extension ChatsListViewController {
    @objc private func didTapAddChatButton() {
        openAddChatForm()
    }
}

//MARK: - setting tableView
extension ChatsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredChats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ChatsTableViewCell = tableView.dequeueReusableCell(for: indexPath) else {
            return UITableViewCell()
        }
                
        let rowData = filteredChats[indexPath.row]
        cell.handle(with: rowData)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let removedItem = self.filteredChats.remove(at: indexPath.row)
            self.allChats.remove(at: allChats.firstIndex(of: removedItem) ?? 0)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if mainView.searchField.isEditing {
            mainView.searchField.resignFirstResponder()
        }
        
        openChatViewController(id: allChats[indexPath.row].id)
    }
    
    // exit from searchField when start scrolling tableView
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        mainView.searchField.resignFirstResponder()
    }
}

//MARK: - setting textfield
extension ChatsListViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let searchText = (textField.text as? NSString)?.replacingCharacters(in: range, with: string) else {
            return true
        }
        
        filteredChats = !searchText.isEmpty ? allChats.filter { item in item.chatName.lowercased().contains(searchText.lowercased()) || item.lastMessage!.lowercased().contains(searchText.lowercased()) } : allChats
        
            mainView.tableView.reloadData()
  
        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        filteredChats = allChats
        
        mainView.tableView.reloadData()
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        mainView.placeholderLabel.isHidden = true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let isSearchFieldEmpty = textField.text?.isEmpty {
            if isSearchFieldEmpty {
                mainView.placeholderLabel.isHidden = false
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

//MARK: - functionality of adding new chat
extension ChatsListViewController {
    private func openAddChatForm() {
        DispatchQueue.main.async { [self] in
            let addChatAlert = UIAlertController(title: LocalizationKeys.chatCreateTitle.rawValue.localized, message: nil, preferredStyle: .alert)
            
            addChatAlert.addTextField { textField in
                textField.placeholder = LocalizationKeys.chatCreateAlertPlaceholder.rawValue.localized
            }
                        
            let cancelAction = UIAlertAction(title: LocalizationKeys.chatCreateAlertCancelAction.rawValue.localized, style: .default, handler: nil)
            let addAction = UIAlertAction(title: LocalizationKeys.chatCreateAlertCreateAction.rawValue.localized, style: .default) { _ in
                
                guard let textField = addChatAlert.textFields?.first else {
                    return
                }
                
                if let newChat = textField.text?.trim() {
                    let isValide = self.performValidationChatName(chatName: newChat)
                    
                    if isValide {
                        self.openChatViewController(chatName: newChat)
                    }
                }
                
            }
            
            addChatAlert.addAction(addAction)
            addChatAlert.addAction(cancelAction)
            
            present(addChatAlert, animated: true, completion: nil)
        }
    }
}

//MARK: - deselect row
extension ChatsListViewController {
    private func deselectRow(animated: Bool) {
        if let selectedIndexPath = mainView.tableView.indexPathForSelectedRow {
            mainView.tableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
    }
}

extension ChatsListViewController: ChatViewControllerDelegate {
    func didChatCreated(chat: Chat) {
        guard allChats.filter({ $0.id == chat.id }).first == nil else {
            return
        }

        if let searchText = self.mainView.searchField.text {
            if !searchText.isEmpty && chat.chatName.lowercased().contains(searchText.lowercased()) {
                self.filteredChats.append(chat)
            } else {
                self.filteredChats.append(chat)
            }
            
            self.allChats.append(chat)
        }
    }
}

extension ChatsListViewController {
    private func performValidationChatName(chatName: String) -> Bool{
        do {
            try Validation.validateChatName(chatName: chatName, allChats: allChats)
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
