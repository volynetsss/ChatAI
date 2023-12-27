import Foundation
import UIKit
import SnapKit

class ChatsTableViewCell: UITableViewCell, Reusable {
    
    //TODO: - FOR TEST
    
    
    let chatName: UILabel = {
        let obj =  UILabel()
        obj.font = .Poppins.medium(size: 15).font
        obj.textColor = UIColor(resource: .labelWhiteBlack)
        return obj
    }()
    
    let lastMessage: UILabel = {
        let obj =  UILabel()
        obj.numberOfLines = 2
        obj.lineBreakMode = .byTruncatingTail
        obj.font = .SfProText.regular(size: 14).font
        obj.textColor = UIColor(resource: .labelWhiteBlack)
        obj.alpha = 0.35
        return obj
    }()
    
    let avatarView: UIView = {
        let obj = UIView()
        obj.layer.cornerRadius = 28
        obj.clipsToBounds = true
        return obj
    }()
    
    let firstLetterNameLabel: UILabel = {
        let obj =  UILabel()
        obj.font = .Poppins.semiBold(size: 29).font
        obj.textColor = .white
        return obj
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            backgroundColor = UIColor(resource: .cellSelectionWhiteDarkBlue)
        } else {
            backgroundColor = .clear
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupDefaultStyle()
        
        contentView.addSubview(avatarView)
        avatarView.addSubview(firstLetterNameLabel)
        
        contentView.addSubview(chatName)
        contentView.addSubview(lastMessage)
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        avatarView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16.sizeW)
            make.size.equalTo(56)
        }
        
        chatName.snp.makeConstraints { make in
            make.leading.equalTo(avatarView.snp.trailing).offset(11.sizeW)
            make.top.equalTo(contentView).offset(13.sizeH)
            make.trailing.equalToSuperview().offset(-16.sizeW)
        }
        
        lastMessage.snp.makeConstraints { make in
            make.leading.equalTo(avatarView.snp.trailing).offset(11.sizeW)
            make.trailing.equalToSuperview().offset(-16.sizeW)
            make.top.equalTo(chatName.snp.bottom).offset(9.sizeH)
            make.bottom.equalTo(contentView).offset(-12.sizeH)
        }
        
        firstLetterNameLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

// MARK: - adding data to items
extension ChatsTableViewCell {
    func handle(with data: Chat) {
        chatName.text = data.chatName
        lastMessage.text = data.lastMessage
        firstLetterNameLabel.text = data.chatName.first.map(String.init)?.uppercased()
        avatarView.backgroundColor = data.avatarColor

        
    }
}

// MARK: - setting default style for cell
extension ChatsTableViewCell {
    private func setupDefaultStyle() {
        separatorInset = UIEdgeInsets(top: 0, left: 83, bottom: 0, right: 16)
        
        backgroundColor = .clear
        selectionStyle = .none
    }
}
