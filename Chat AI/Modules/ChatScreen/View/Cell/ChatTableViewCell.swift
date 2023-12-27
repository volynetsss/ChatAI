import Foundation
import UIKit
import SnapKit

class ChatTableViewCell: UITableViewCell, Reusable {
    var bezierpath: UIBezierPath?
    
    let bubbleView: BubbleView = {
        let obj = BubbleView()
        obj.backgroundColor = .clear
        return obj
    }()
    
    let messageLabel: UILabel = {
        let obj = UILabel()
        obj.numberOfLines = 0
        obj.textColor = UIColor(resource: .labelWhiteBlack)
        obj.font = .SfProText.regular(size: 16).font
        return obj
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupDefaultDesign()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.addSubview(bubbleView)
        bubbleView.addSubview(messageLabel)
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(22)
            make.bottom.equalTo(contentView).offset(-22)
            make.width.lessThanOrEqualTo(260.sizeW)
        }
        
        bubbleView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(8.sizeH)
            make.bottom.equalTo(contentView).offset(-8.sizeH)
            make.leading.equalTo(messageLabel.snp.leading).offset(-11.sizeW)
            make.trailing.equalTo(messageLabel.snp.trailing).offset(12.sizeW)
        }
    }
}

extension ChatTableViewCell {
    func handleData(messages: Message?) {
        guard let messages = messages else {return}
        bubbleView.isIncoming = messages.isIncoming
        bezierpath = bubbleView.getBeizerPath()

        if messages.isIncoming {
            messageLabel.snp.remakeConstraints { make in
                make.top.equalTo(contentView).offset(22.sizeH)
                make.bottom.equalTo(contentView).offset(-22.sizeH)
                make.width.lessThanOrEqualTo(240.sizeW)
                make.leading.equalTo(contentView).offset(24.sizeW)
            }
            
            bubbleView.snp.updateConstraints { make in
                make.leading.equalTo(messageLabel.snp.leading).offset(-16.sizeW)
                make.trailing.equalTo(messageLabel.snp.trailing).offset(12.sizeW)
            }
            
        } else {
            messageLabel.snp.remakeConstraints { make in
                make.top.equalTo(contentView).offset(22) //!
                make.bottom.equalTo(contentView).offset(-22) //!
                make.width.lessThanOrEqualTo(240.sizeW)
                make.trailing.equalTo(contentView).offset(-28.sizeW)
            }
            
            bubbleView.snp.updateConstraints { make in
                make.leading.equalTo(messageLabel.snp.leading).offset(-16.sizeW)
                make.trailing.equalTo(messageLabel.snp.trailing).offset(20.sizeW)
            }
        }
        
        messageLabel.text = messages.content
    }
}

//MARK: - setting default design
extension ChatTableViewCell {
    private func setupDefaultDesign() {
        backgroundColor = .clear
        selectionStyle = .none
    }
}
