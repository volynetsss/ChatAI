import Foundation
import UIKit

class OnboardHeaderTitle: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        font = .Poppins.semiBold(size: 29).font
        lineBreakMode = .byWordWrapping
        textAlignment = .center
        numberOfLines = 0
        textColor = UIColor(resource: .accentGray)
    }
    
}
