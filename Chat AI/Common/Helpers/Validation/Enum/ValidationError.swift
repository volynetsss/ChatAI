import Foundation

enum ValidationError: Error {
    case chatNameTooBig
    case chatNameIsBlank
    case chatNameAlreadyExist
    
    case messageIsBlank

    var localizedDescription: String {
        switch self {
        case .chatNameTooBig:
            return NSLocalizedString(LocalizationKeys.errorChatNameBig.rawValue.localized, comment: "")
        case .chatNameIsBlank:
            return NSLocalizedString(LocalizationKeys.errorChatNameIsBlank.rawValue.localized, comment: "")
        case .chatNameAlreadyExist:
            return NSLocalizedString(LocalizationKeys.errorChatNameAlreadyExist.rawValue.localized, comment: "")
        case .messageIsBlank:
            return NSLocalizedString(LocalizationKeys.errorMessageIsBlank.rawValue.localized, comment: "")
        }
    }
}
