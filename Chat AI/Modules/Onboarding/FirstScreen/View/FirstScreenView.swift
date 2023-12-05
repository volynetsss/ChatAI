import Foundation
import UIKit
import SnapKit

class FirstScreenView: UIView {
    
    private let logoTextImage: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(resource: .logoText)
        obj.contentMode = .scaleAspectFit
        return obj
    }()
    
    private let titleLabel: OnboardHeaderTitle = {
        let obj = OnboardHeaderTitle()
        obj.text = LocalizationKeys.onboardTitleFirst.rawValue.localized
        
        return obj
    }()
    
    private let firstScreenImage: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(resource: .firstScreen)
        obj.contentMode = .scaleAspectFit
        
        return obj
    }()
    
    private let nextButton: GradientButton = {
        let obj = GradientButton()
        obj.setTitle(LocalizationKeys.onBoardNextButton.rawValue.localized, for: .normal)
        
        return obj
    }()
    
    private let detailText: OnboardDetailText = {
        let obj = OnboardDetailText()
        obj.text = LocalizationKeys.onBoardDetailTextFirst.rawValue.localized
        
        return obj
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupBackground()
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBackground() {
        backgroundColor = UIColor(resource: .accentPurple)
    }
    
    private func setup() {
        addSubview(logoTextImage)
        addSubview(titleLabel)
//        addSubview(mainImageContainer)
     /*   mainImageContainer.*/addSubview(firstScreenImage)
        addSubview(nextButton)
        addSubview(detailText)
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        logoTextImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(27.sizeH)
            make.width.lessThanOrEqualTo(48.sizeW)
            make.height.lessThanOrEqualTo(15.sizeH)
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoTextImage.snp.bottom).offset(36.sizeH)
            make.leading.trailing.equalToSuperview().inset(37.sizeW)
        }
        
        firstScreenImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(32.sizeW)
            make.bottom.equalTo(nextButton.snp.top)

//            make.top.equalTo(titleLabel.snp.bottom)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(firstScreenImage.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(16.sizeW)
            make.height.equalTo(57.sizeH)
            make.centerX.equalToSuperview()
        }
        
        detailText.snp.makeConstraints { make in
            make.top.equalTo(nextButton.snp.bottom).offset(18.sizeH)
            make.leading.trailing.equalToSuperview().inset(30.sizeW)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-45.sizeH)
        }
    }
}
