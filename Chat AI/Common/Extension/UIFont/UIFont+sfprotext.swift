import Foundation
import UIKit

extension UIFont {
    enum SfProText {
        case light(size: CGFloat)
        case medium(size: CGFloat)
        case regular(size: CGFloat)
        case semiBold(size: CGFloat)
        case bold(size: CGFloat)
        
        var font: UIFont! {
            switch self {
            case .light(let size):
                return UIFont(name: "SFProText-Light", size: size)
            case .medium(let size):
                return UIFont(name: "SFProText-Medium", size: size)
            case .regular(let size):
                return UIFont(name: "SFProText-Regular", size: size)
            case .semiBold(let size):
                return UIFont(name: "SFProText-Semibold", size: size)
            case .bold(let size):
                return UIFont(name: "SFProText-Bold", size: size)
            }
        }
    }
}

