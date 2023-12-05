import Foundation
import UIKit

extension UIFont {
    enum Poppins {
        case medium(size: CGFloat)
        case semiBold(size: CGFloat)
        
        var font: UIFont! {
            switch self {
            case .medium(let size):
                return UIFont(name: "Poppins-Medium", size: size)
            case .semiBold(let size):
                return UIFont(name: "Poppins-SemiBold", size: size)
            }
        }
    }
}
