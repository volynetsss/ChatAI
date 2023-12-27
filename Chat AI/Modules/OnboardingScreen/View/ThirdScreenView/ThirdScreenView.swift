import Foundation
import SnapKit
import UIKit

class ThirdScreenView: UIView {
    let titleLabel: HeaderLabel = {
        let obj = HeaderLabel()
        return obj
    }()
    
    let descriptionTitle: UILabel = {
        let obj = UILabel()
        obj.text = LocalizationKeys.onboardDescTrialTitle.rawValue.localized
        obj.font = .SfProText.bold(size: 18).font
        obj.textColor = UIColor(resource: .mainTextDarkBlueWhite)
        return obj
    }()
    
    let firstCircle: UIView = {
        let obj = UIView()
        obj.backgroundColor = UIColor(resource: .mainButtonDefaultColorPurple)
        obj.layer.cornerRadius = 3
        obj.clipsToBounds = true
        return obj
    }()
    
    let secondCircle: UIView = {
        let obj = UIView()
        obj.backgroundColor = UIColor(resource: .mainButtonDefaultColorPurple)
        obj.layer.cornerRadius = 3
        obj.clipsToBounds = true
        return obj
    }()
    
    let thirdCircle: UIView = {
        let obj = UIView()
        obj.backgroundColor = UIColor(resource: .mainButtonDefaultColorPurple)
        obj.layer.cornerRadius = 3
        obj.clipsToBounds = true
        return obj
    }()
    
    let dashedLine: DashedLineView = {
        let obj = DashedLineView()
        return obj
    }()
    
    let container: UIView = {
        let obj = UIView()
        obj.backgroundColor = UIColor(resource: .containerBackgroundWhiteDarkBlue)
        obj.layer.cornerRadius = 18
        return obj
    }()
    
    let generalStackView: UIStackView = {
        let obj = UIStackView()
        obj.axis = .vertical
        obj.spacing = 26
        return obj
    }()
    
    let firstItem: UIView = {
        let obj = UIView()
        return obj
    }()
    
    let secondItem: UIView = {
        let obj = UIView()
        return obj
    }()
    
    let thirdItem: UIView = {
        let obj = UIView()
        return obj
    }()
    
    let titleOfPointOne: UILabel = {
        let obj = UILabel()
        obj.text = LocalizationKeys.onboardPointFirstTitle.rawValue.localized
        obj.font = .SfProText.bold(size: 16).font
        obj.textColor = UIColor(resource: .mainTextDarkBlueWhite)
        return obj
    }()
    
    let descOfPointOne: UILabel = {
        let obj = UILabel()
        obj.text = LocalizationKeys.onboardPointFirstDesc.rawValue.localized
        obj.font = .SfProText.light(size: 12).font
        obj.textColor = UIColor(resource: .mainTextDarkBlueWhite)
        obj.alpha = 0.5
        return obj
    }()

    let titleOfPointTwo: UILabel = {
        let obj = UILabel()
        obj.font = .SfProText.bold(size: 16).font
        obj.textColor = UIColor(resource: .mainTextDarkBlueWhite)
        obj.text = LocalizationKeys.onboardPointSecondTitle.rawValue.localized
        return obj
    }()
    
    let descOfPointTwo: UILabel = {
        let obj = UILabel()
        obj.text = LocalizationKeys.onboardPointSecondDesc.rawValue.localized
        obj.font = .SfProText.light(size: 12).font
        obj.textColor = UIColor(resource: .mainTextDarkBlueWhite)

        obj.alpha = 0.5

        return obj
    }()
    
    let titleOfPointThird: UILabel = {
        let obj = UILabel()
        obj.font = .SfProText.bold(size: 16).font
        obj.textColor = UIColor(resource: .mainTextDarkBlueWhite)
        obj.text = LocalizationKeys.onboardPointThirdTitle.rawValue.localized
        return obj
    }()
    
    let descOfPointThird: UILabel = {
        let obj = UILabel()
        obj.text = LocalizationKeys.onboardPointThirdDesc.rawValue.localized
        obj.font = .SfProText.light(size: 12).font
        obj.textColor = UIColor(resource: .mainTextDarkBlueWhite)

        obj.numberOfLines = 0
        obj.lineBreakMode = .byWordWrapping
        obj.alpha = 0.5

        return obj
    }()
    
    let containerFristCircleTitle: UIStackView = {
        let obj = UIStackView()
        obj.axis = .horizontal
        obj.spacing = 15
        obj.distribution = .fillProportionally
        obj.alignment = .center
        return obj
    }()
    
    let containerSecondCircleTitle: UIStackView = {
        let obj = UIStackView()
        obj.axis = .horizontal
        obj.spacing = 15
        obj.alignment = .center
        return obj
    }()
    
    let containerThirdCircleTitle: UIStackView = {
        let obj = UIStackView()
        obj.axis = .horizontal
        obj.spacing = 15
        obj.alignment = .center
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
        addSubview(descriptionTitle)
        addSubview(container)
        
        container.addSubview(dashedLine)
        container.addSubview(generalStackView)
        

        generalStackView.addArrangedSubview(firstItem)
        generalStackView.addArrangedSubview(secondItem)
        generalStackView.addArrangedSubview(thirdItem)

        firstItem.addSubview(containerFristCircleTitle)
        containerFristCircleTitle.addArrangedSubview(firstCircle)
        containerFristCircleTitle.addArrangedSubview(titleOfPointOne)
        firstItem.addSubview(descOfPointOne)
        
        secondItem.addSubview(containerSecondCircleTitle)
        containerSecondCircleTitle.addArrangedSubview(secondCircle)
        containerSecondCircleTitle.addArrangedSubview(titleOfPointTwo)

        
        secondItem.addSubview(descOfPointTwo)
        
        thirdItem.addSubview(containerThirdCircleTitle)
        containerThirdCircleTitle.addArrangedSubview(thirdCircle)
        containerThirdCircleTitle.addArrangedSubview(titleOfPointThird)
        
        thirdItem.addSubview(descOfPointThird)

        makeConstraints()
    }
    
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(37.sizeW)
        }
        
        descriptionTitle.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30.sizeH)
            make.leading.equalToSuperview().offset(51.sizeW)
        }
        
        container.snp.makeConstraints { make in
            make.top.equalTo(descriptionTitle.snp.bottom).offset(13.sizeH)
            make.leading.trailing.equalToSuperview().inset(13.sizeW)
            make.bottom.equalTo(generalStackView.snp.bottom).offset(37.sizeH)
        }
        
        dashedLine.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(34.sizeH)
            make.leading.equalToSuperview().offset(29.35.sizeW)
            make.width.equalTo(0.8.sizeW)
            make.bottom.equalToSuperview()
        }
        
        generalStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(26.sizeH)
            make.leading.equalToSuperview().offset(27.sizeW)
            make.bottom.equalTo(thirdItem.snp.bottom)
//            make.trailing.equalToSuperview().offset(37.sizeW)
        }
        
        firstItem.snp.makeConstraints { make in
            make.bottom.equalTo(descOfPointOne.snp.bottom)
        }
        
        containerFristCircleTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()
        }
        
        firstCircle.snp.makeConstraints { make in
                    make.size.equalTo(6)
                }
        
        descOfPointOne.snp.makeConstraints { make in
            make.top.equalTo(containerFristCircleTitle.snp.bottom).offset(5.sizeH)
            make.leading.equalTo(firstCircle.snp.trailing).offset(15.sizeW)
        }
        
        secondItem.snp.makeConstraints { make in
            make.bottom.equalTo(descOfPointTwo.snp.bottom)
        }
        
        containerSecondCircleTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()

        }
        
        secondCircle.snp.makeConstraints { make in
            make.size.equalTo(6)
        }

        
        descOfPointTwo.snp.makeConstraints { make in
                   make.top.equalTo(containerSecondCircleTitle.snp.bottom).offset(5.sizeH)
                   make.leading.equalTo(secondCircle.snp.trailing).offset(15.sizeW)
               }
       
    
        thirdItem.snp.makeConstraints { make in
            make.bottom.equalTo(descOfPointThird.snp.bottom)
            make.trailing.equalToSuperview().offset(-37.sizeW)
        }

        containerThirdCircleTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()

            make.bottom.equalTo(titleOfPointThird.snp.bottom)
        }
////
       
        
//        
//
        descOfPointThird.snp.makeConstraints { make in
            make.top.equalTo(containerThirdCircleTitle.snp.bottom).offset(5.sizeH)
            make.leading.equalTo(thirdCircle.snp.trailing).offset(15.sizeW)
//            make.trailing.equalToSuperview().offset(-37.sizeW)
            make.width.equalTo(264.sizeW)
        }
//        
        
        
//        
//
////        
//
//        
////
        thirdCircle.snp.makeConstraints { make in
            make.size.equalTo(6)
        }
    }
}

