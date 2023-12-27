import Foundation
import UIKit

class RadialGradientView: UIView {
        let startColor: UIColor = {
            let obj = UIColor(resource: .startColorLightPurple)
            return obj
        }()
    
        let endColor: UIColor = {
            let obj = UIColor(resource: .endColorTransparent)
            return obj
        }()
        
       override init(frame: CGRect) {
           super.init(frame: frame)
           setup()
       }

       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
       }

       private func setup() {
           backgroundColor = .clear
       }

       override func draw(_ rect: CGRect) {
           guard let context = UIGraphicsGetCurrentContext() else {
               return
           }

           let colors = [startColor.cgColor, endColor.cgColor]
           let colorSpace = CGColorSpaceCreateDeviceRGB()

           let locations: [CGFloat] = [0.0, 1.0]

           if let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: locations) {
               let center = CGPoint(x: bounds.midX, y: bounds.minY)
               let radius = min(bounds.width, bounds.height) * 0.9

               context.drawRadialGradient(
                   gradient,
                   startCenter: center,
                   startRadius: 0,
                   endCenter: center,
                   endRadius: radius,
                   options: []
               )
           }
       }
}
