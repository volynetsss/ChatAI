import Foundation

extension String {
    var localized: String {
        return String(localized: LocalizationValue(self))
    }
}
