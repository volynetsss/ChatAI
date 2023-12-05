import Foundation
import UIKit

class OnboardDetailText: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        font = .SfProText.regular(size: 12).font
        lineBreakMode = .byWordWrapping
        textAlignment = .center
        numberOfLines = 0
        textColor = UIColor(resource: .accentGray)
        alpha = 0.3
    }
    
}
