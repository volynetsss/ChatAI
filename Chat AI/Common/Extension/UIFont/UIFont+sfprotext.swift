import Foundation
import UIKit

extension UIFont {
    enum SfProText {
        case medium(size: CGFloat)
        case regular(size: CGFloat)
        case semiBold(size: CGFloat)
        
        var font: UIFont! {
            switch self {
            case .medium(let size):
                return UIFont(name: "SFProText-Medium", size: size)
            case .regular(let size):
                return UIFont(name: "SFProText-Regular", size: size)
            case .semiBold(let size):
                return UIFont(name: "SFProText-Bold", size: size)
            }
        }
    }
}

