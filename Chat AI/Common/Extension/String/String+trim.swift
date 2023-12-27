import Foundation

extension String {
    mutating func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
