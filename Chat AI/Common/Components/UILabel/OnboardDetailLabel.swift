import Foundation
import UIKit

class OnboardDetailLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        font = .SfProText.light(size: 15).font
        lineBreakMode = .byWordWrapping
        textAlignment = .center
        numberOfLines = 0
        textColor = UIColor(resource: .detailTextGrayWhite)
        alpha = 0.46
    }
    
}
