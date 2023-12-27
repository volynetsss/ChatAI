import Foundation

let maxChatNameChar = 20

class Validation {

    static func validateChatName(chatName: String, allChats: [Chat]) throws {
        guard !chatName.isEmpty else {
            throw ValidationError.chatNameIsBlank
        }
        
        guard allChats.filter({ $0.chatName == chatName }).first == nil else {
            throw ValidationError.chatNameAlreadyExist
        }
    
        guard chatName.count < maxChatNameChar else {
            throw ValidationError.chatNameTooBig
        }
    }
    
    static func validateMessage(message: String) throws {
        guard !message.isEmpty else {
            throw ValidationError.messageIsBlank
        }
    }
}
