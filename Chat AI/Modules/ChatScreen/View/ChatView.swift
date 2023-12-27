import Foundation
import UIKit
import SnapKit

class ChatView: UIView {
    let blurheaderContainer: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .regular)
        let obj = UIVisualEffectView(effect: blurEffect)
        obj.backgroundColor = UIColor(resource: .viewHeaderBackgroundGrayDarkBlue)
        obj.alpha = 0.9
        return obj
    }()
    
    let borderView: UIView = {
        let obj = UIView()
        obj.backgroundColor = UIColor(resource: .viewHeaderBorderGrayDarkBlue)
        obj.isUserInteractionEnabled = true 
        return obj
    }()
    
    let tableView: UITableView = {
        let obj = UITableView()
        obj.backgroundColor = .clear
        obj.contentInset = UIEdgeInsets(top: CGFloat(75.0), left: 0, bottom: 0, right: 0)
        obj.separatorStyle = .none
        return obj
    }()
    
    let backButton: UIButton = {
        let obj = UIButton()
        obj.setImage(UIImage(resource: .backBtn), for: .normal)
        return obj
    }()
    
    let chatNameLabel:  UILabel = {
        let obj = UILabel()
        obj.text = "Atveroeoset accusamus dupol"
        obj.sizeToFit()
        obj.textColor = UIColor(resource: .mainLabelWhiteBlack)
        obj.font = .Poppins.semiBold(size: 16).font
        return obj
    }()
    
    let avatarView: UIView = {
        let obj = UIView()
        obj.layer.cornerRadius = 18
        obj.clipsToBounds = true
        return obj
    }()
    
    let firstLetterNameLabel: UILabel = {
        let obj =  UILabel()
        obj.font = .Poppins.semiBold(size:19).font
        obj.textColor = .white
        obj.text = "A"
        return obj
    }()
    
    let statusLabel: UILabel = {
        let obj =  UILabel()
        obj.font = .SfProText.regular(size:12).font
        obj.textColor = UIColor(resource: .statusLabelPurpleWhite)
        obj.text = "online"
        return obj
    }()
    
    let containerStackView: UIStackView = {
        let obj = UIStackView()
        obj.axis = .horizontal
        obj.spacing = 10
        obj.alignment = .bottom
        return obj
    }()
    
    let placeholderLabel: UILabel = {
        let obj = UILabel()
        obj.font = .SfProText.regular(size: 16).font
        obj.text = "Search"
        obj.textColor = UIColor(resource: .labelWhiteBlack)
        obj.alpha = 0.35
        return obj
    }()
    
    let messageView: UIView = {
        let obj = UIView()
        obj.backgroundColor = UIColor(resource: .messageFieldWhiteDarkBlue)
        obj.layer.cornerRadius = 18.0
        obj.layer.masksToBounds = true
        return obj
    }()
    
    let messageField: UITextView = {
        let obj = UITextView()
        obj.backgroundColor = UIColor(resource: .messageFieldWhiteDarkBlue)
        obj.layer.cornerRadius = 18.0
        obj.font = .SfProText.regular(size: 16).font
        obj.textColor = UIColor(resource: .labelWhiteBlack)
        obj.layer.masksToBounds = true
        obj.isScrollEnabled = false
        obj.tintColor = UIColor(resource: .messageFieldTintLightPurple)
        obj.textContainerInset = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 20)
        return obj
    }()
    
    let messageFieldPlaceholder: UILabel = {
        let obj = UILabel()
        obj.font = .SfProText.regular(size: 16).font
        obj.text = "Message"
        obj.textColor = UIColor(resource: .labelWhiteBlack)
        obj.alpha = 0.35
        return obj
    }()
    
    let sendButton: UIButton = {
        let obj = UIButton()
        obj.setImage(UIImage(resource: .sendBtn), for: .normal)
        return obj
    }()
    
    let microphoneIcon: UIImageView = {
        let obj = UIImageView()
        obj.contentMode = .scaleAspectFit
        obj.image = UIImage(resource: .microphoneBtn)
        return obj
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = UIColor(resource: .backgroundGrayDarkBlue)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(tableView)

        addSubview(blurheaderContainer)
        addSubview(borderView)

        blurheaderContainer.contentView.addSubview(chatNameLabel)
        
        blurheaderContainer.contentView.addSubview(backButton)
        blurheaderContainer.contentView.addSubview(statusLabel)
        
        blurheaderContainer.contentView.addSubview(avatarView)
        avatarView.addSubview(firstLetterNameLabel)
        
        addSubview(sendButton)
        addSubview(messageView)
        messageView.addSubview(microphoneIcon)
        messageView.addSubview(messageField)
        messageView.addSubview(messageFieldPlaceholder)

        
        

        makeConstraints()
        
    }
    
    private func makeConstraints() {
        blurheaderContainer.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(statusLabel.snp.bottom).offset(14.sizeH)
        }
        
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8.sizeW)
            make.bottom.equalToSuperview().offset(-17.sizeH)
        }
        
        chatNameLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(19.sizeH)
            make.centerX.equalToSuperview()
        }
        
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(chatNameLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        borderView.snp.makeConstraints { make in
            make.top.equalTo(blurheaderContainer.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(0.4)
        }
        
        //        containerStackView.snp.makeConstraints { make in
        //            make.leading.trailing.equalToSuperview().inset(13.sizeW)
        //            make.bottom.equalTo(keyboardLayoutGuide.snp.top).offset(-9.sizeH)
        //        }
        
        sendButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-12.sizeW)
            make.height.equalTo(40.sizeH)
            make.width.equalTo(42.sizeW)
            make.bottom.equalTo(keyboardLayoutGuide.snp.top).offset(-9.sizeH)
        }
        
        messageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(13.sizeW)
//            make.top.greaterThanOrEqualTo(sendButton.snp.top)
            make.top.equalTo(messageField.snp.top)
            make.bottom.equalTo(keyboardLayoutGuide.snp.top).offset(-9.sizeH)
            make.trailing.equalTo(sendButton.snp.leading).offset(-10.sizeW)
        }
        
        messageField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(13.sizeW)
//            make.top.equalTo(sendButton.snp.top)
            make.height.greaterThanOrEqualTo(40.sizeH)
            make.bottom.equalTo(keyboardLayoutGuide.snp.top).offset(-9.sizeH)
            make.trailing.equalTo(microphoneIcon.snp.leading)
        }
        
        microphoneIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-15.sizeW)
        }
        
        messageFieldPlaceholder.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(25.sizeW)
        }
        
        //        messageField.snp.makeConstraints { make in
        //            make.trailing.equalTo(sendButton.snp.leading)
        //            make.height.greaterThanOrEqualTo(40.sizeH)
        //        }
        
        //        microphoneIcon.snp.makeConstraints { make in
        //            make.width.equalTo(15.sizeW)
        //            make.height.equalTo(22.sizeH)
        //            make.trailing.equalToSuperview().offset(-15.sizeW)
        //            make.centerY.equalToSuperview()
        //        }
        
        //        blankContainer.snp.makeConstraints { make in
        //            make.leading.top.bottom.equalToSuperview()
        //            make.width.equalTo(25.sizeW)
        //        }
        
        avatarView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-11.sizeW)
            make.bottom.equalToSuperview().offset(-14.sizeH)
            make.size.equalTo(36)
        }
        
        firstLetterNameLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(messageView.snp.top).offset(-10.sizeH)
        }
    }
}

extension ChatView {
    func handle(chat: Chat?) {
        guard let chat = chat else {return}
        avatarView.backgroundColor = chat.avatarColor
        chatNameLabel.text = chat.chatName
        firstLetterNameLabel.text = chat.chatName.first.map(String.init)?.uppercased()
    }
}
