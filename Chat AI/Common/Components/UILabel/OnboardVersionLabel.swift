import Foundation
import UIKit

class OnboardVersionLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        font = .SfProText.regular(size: 11).font
        textAlignment = .center
        textColor = UIColor(resource: .versonTextDarkBlueWhite)
        alpha = 0.11
    }
    
}

