import Foundation
import SnapKit
import UIKit

class FirstTwoScreensView: UIView {
    let titleLabel: HeaderLabel = {
        let obj = HeaderLabel()
        return obj
    }()
    
    let mainImage: UIImageView = {
        let obj = UIImageView()
        obj.contentMode = .scaleAspectFit
        return obj
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setup() {
        addSubview(titleLabel)
        addSubview(mainImage)

        makeConstraints()
    }
    
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(37.sizeW)
        }
       
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(372.sizeW)
            make.height.equalTo(300.sizeH)
            make.bottom.equalToSuperview()
        }
    }
}
