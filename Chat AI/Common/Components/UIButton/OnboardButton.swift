import Foundation
import UIKit

class OnboardButton: UIButton {
    let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        clipsToBounds = true
        layer.cornerRadius = 14
        setTitleColor(UIColor.white, for: .normal)
        titleLabel?.font = .SfProText.bold(size: 18).font
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}

//MARK: - Adding gradient to the button
extension OnboardButton {
    func setupGradientStyle() {
        gradientLayer.colors = [UIColor(resource: .mainButtonGradientFirstColorPink).cgColor, UIColor(resource: .mainButtonGradientSecondColorLightPurple).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

//MARK: - Adding default background to the button
extension OnboardButton {
    func setupDefaultStyle() {
        gradientLayer.removeFromSuperlayer()
        backgroundColor = UIColor(resource: .mainButtonDefaultColorPurple)
    }
}
