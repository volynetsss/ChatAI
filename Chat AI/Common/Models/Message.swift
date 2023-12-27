import Foundation

struct Message: Equatable {
    let id: UUID
    let content: String
    let isIncoming: Bool
}
