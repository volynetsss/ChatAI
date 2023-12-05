import Foundation
import UIKit

class GradientButton: UIButton {
    let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        gradientLayer.colors = [UIColor(resource: .buttonGradientFirst).cgColor, UIColor(resource: .buttonGradientSecond).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
  
        layer.insertSublayer(gradientLayer, at: 0)
        
        clipsToBounds = true
        layer.cornerRadius = 14
        setTitleColor(UIColor(resource: .accentGray), for: .normal)
        titleLabel?.font = .SfProText.medium(size: 18).font
    }
    
    //    func setGradientColors(startColor: UIColor, endColor: UIColor) {
    //        self.startColor = startColor
    //        self.endColor = endColor
    //
    //        if let gradientLayer = layer.sublayers?.first as? CAGradientLayer {
    //            gradientLayer.colors = [startColor, endColor]
    //        }
    //
    //    }
    
}
