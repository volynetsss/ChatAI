import Foundation
import UIKit

class Chat: Equatable {
    static func == (lhs: Chat, rhs: Chat) -> Bool {
        return lhs.id == rhs.id &&
                    lhs.chatName == rhs.chatName &&
                    lhs.lastMessage == rhs.lastMessage &&
                    lhs.messages == rhs.messages
    }
    
    let id: UUID
    let chatName: String
    var lastMessage: String?
    var messages: [Message] = []
    var avatarColor: UIColor
    
    init(id: UUID, chatName: String, lastMessage: String? = nil) {
        self.id = id
        self.chatName = chatName
        self.lastMessage = lastMessage
        self.avatarColor = .getRandomColor()
    }
    
    
    func send(text: String, isIncoming: Bool) {
        let message = Message(id: UUID(), content: text, isIncoming: isIncoming)
        messages.append(message)
        lastMessage = message.content
    }
    
    func getMessage() {
        let message = Message(id: UUID(), content: "Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus facere possimus, omnis. Temporibus autem quibusdam et aut officiis debitis omnis dolor quo minus id.", isIncoming: true)
        messages.append(message)
        lastMessage = message.content
    }
    
    
}


