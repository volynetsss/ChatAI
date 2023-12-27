import Foundation
import UIKit

class DashedLineView: UIView {
    override init(frame: CGRect) {
        super.init(frame: .zero)
//        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class var layerClass: AnyClass {
            return CAGradientLayer.self
        }

        override func layoutSubviews() {
            super.layoutSubviews()

            if let gradientLayer = layer as? CAGradientLayer {
                gradientLayer.colors = [UIColor(resource: .startColorDashedLinePurple).cgColor, UIColor(resource: .endColorDashedLineTransparent).cgColor]
                gradientLayer.locations = [0.0, 1.0]
                gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
                gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)

                let dashedLine = CAShapeLayer()
                dashedLine.strokeColor = UIColor(resource: .containerBackgroundWhiteDarkBlue).cgColor
                dashedLine.lineDashPattern = [3, 3]
                dashedLine.lineWidth = 0.8

                let path = UIBezierPath()
                path.move(to: CGPoint(x: bounds.width / 2, y: 0))
                path.addLine(to: CGPoint(x: bounds.width / 2, y: bounds.height))

                dashedLine.path = path.cgPath
                layer.addSublayer(dashedLine)
                
            }
        }
}
