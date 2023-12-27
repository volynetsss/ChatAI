import Foundation
import UIKit

class BubbleView: UIView {
    var bezierPath = UIBezierPath()
    
    var isIncoming: Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
    
    func getBeizerPath() -> UIBezierPath {
        return bezierPath
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let bottom = rect.height
        let right = rect.width
        let top = 0
        let left = 0
        
        if !isIncoming {
            
            UIColor(resource: .bubbleViewOutcomingLightDarkPurple).setFill()

            bezierPath.move(to: CGPoint(x: right - 22, y: bottom))
            bezierPath.addLine(to: CGPoint(x: 17, y: bottom))
            bezierPath.addCurve(to: CGPoint(x: left, y: Int(bottom) - 18), controlPoint1: CGPoint(x: 7.61, y: bottom), controlPoint2: CGPoint(x: 0, y: bottom - 7.61))
            bezierPath.addLine(to: CGPoint(x: left, y: 17))
            bezierPath.addCurve(to: CGPoint(x: 17, y: top), controlPoint1: CGPoint(x: 0, y: 7.61), controlPoint2: CGPoint(x: 7.61, y: 0))
            bezierPath.addLine(to: CGPoint(x: Int(right) - 21, y: top))
            bezierPath.addCurve(to: CGPoint(x: right - 4, y: 17), controlPoint1: CGPoint(x: right - 11.61, y: 1), controlPoint2: CGPoint(x: right - 4, y: 7.61))
            bezierPath.addLine(to: CGPoint(x: right - 4, y: bottom - 11))
            bezierPath.addCurve(to: CGPoint(x: right, y: bottom), controlPoint1: CGPoint(x: right - 4, y: bottom - 1), controlPoint2: CGPoint(x: right, y: bottom))
            bezierPath.addLine(to: CGPoint(x: right + 0.05, y: bottom - 0.01))
                bezierPath.addCurve(to: CGPoint(x: right - 11.04, y: bottom - 4.04), controlPoint1: CGPoint(x: right - 4.07, y: bottom + 0.43), controlPoint2: CGPoint(x: right - 8.16, y: bottom - 1.06))
                bezierPath.addCurve(to: CGPoint(x: right - 22, y: bottom), controlPoint1: CGPoint(x: right - 16, y: bottom), controlPoint2: CGPoint(x: right - 19, y: bottom))
            
        } else {
            
            UIColor(resource: .bubbleViewIncomingWhiteDarkBlue).setFill()

            bezierPath.move(to: CGPoint(x: 22, y: bottom))
                  bezierPath.addLine(to: CGPoint(x: right - 17, y: bottom))
                  bezierPath.addCurve(to: CGPoint(x: right, y: bottom - 17), controlPoint1: CGPoint(x: right - 7.61, y: bottom), controlPoint2: CGPoint(x: right, y: bottom - 7.61))
                  bezierPath.addLine(to: CGPoint(x: right, y: 17))
            bezierPath.addCurve(to: CGPoint(x: Int(right) - 17, y: top), controlPoint1: CGPoint(x: right, y: 7.61), controlPoint2: CGPoint(x: right - 7.61, y: 0))
                  bezierPath.addLine(to: CGPoint(x: 21, y: top))
            bezierPath.addCurve(to: CGPoint(x: 4, y: 17), controlPoint1: CGPoint(x: 11.61, y: 0), controlPoint2: CGPoint(x: 4, y: 7.61))
                  bezierPath.addLine(to: CGPoint(x: 4, y: bottom - 11))
                  bezierPath.addCurve(to: CGPoint(x: 0, y: bottom), controlPoint1: CGPoint(x: 4, y: bottom - 1), controlPoint2: CGPoint(x: 0, y: bottom))
            bezierPath.addLine(to: CGPoint(x: 0.05, y: bottom - 0.01))
                  bezierPath.addCurve(to: CGPoint(x: 11.04, y: bottom - 4.04), controlPoint1: CGPoint(x: 4.07, y: bottom + 0.43), controlPoint2: CGPoint(x: 8.16, y: bottom - 1.06))
                  bezierPath.addCurve(to: CGPoint(x: 22, y: bottom), controlPoint1: CGPoint(x: 16, y: bottom), controlPoint2: CGPoint(x: 19, y: bottom))
        }
        
        bezierPath.close()
        bezierPath.fill()
    }
}
