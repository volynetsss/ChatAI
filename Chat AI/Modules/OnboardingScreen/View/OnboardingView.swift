import Foundation
import UIKit
import SnapKit

class OnboardingView: UIView {
    
    let logoImage: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(resource: .textLogo)
        obj.contentMode = .scaleAspectFit
        return obj
    }()
    
    let closeButton: UIButton = {
        let obj = UIButton()
        obj.setImage(UIImage(resource: .close), for: .normal)
        obj.layer.cornerRadius = 13
        obj.layer.masksToBounds = true
        obj.backgroundColor = UIColor(resource: .closeButtonLightGrayBlue)
        return obj
    }()
    
    let scrollView: UIScrollView = {
        let obj = UIScrollView()
        obj.isPagingEnabled = true
        obj.showsHorizontalScrollIndicator = false

        obj.bounces = false
        return obj
    }()
    
    let stackView: UIStackView = {
        let obj = UIStackView()
        obj.axis = .horizontal
        
        return obj
    }()
    
    private let firstScreen: FirstTwoScreensView = {
        let obj = FirstTwoScreensView()
        obj.titleLabel.text = LocalizationKeys.onboardTitleFirst.rawValue.localized
        obj.mainImage.image = UIImage(resource: .firstScreen)
        return obj
    }()
    
    private let secondScreen: FirstTwoScreensView = {
        let obj = FirstTwoScreensView()
        obj.titleLabel.text = LocalizationKeys.onboardTitleSecond.rawValue.localized
        obj.mainImage.image = UIImage(resource: .secondScreen)
        
        return obj
    }()
    
    private let thirdScreen: ThirdScreenView = {
        let obj = ThirdScreenView()
        obj.titleLabel.text = LocalizationKeys.onboardTitleThird.rawValue.localized
        return obj
    }()
    
    
    let pageControl: UIPageControl = {
        let obj = UIPageControl()
        obj.numberOfPages = 3
        obj.isUserInteractionEnabled = false
        obj.currentPageIndicatorTintColor = UIColor(resource: .activePageControlPurple)
        obj.pageIndicatorTintColor = UIColor(resource: .nonActivePageControlDarkBlueGray)
        return obj
    }()
    
    let onboardButton: OnboardButton = {
        let obj = OnboardButton()
        obj.setTitle(LocalizationKeys.onboardNextButton.rawValue.localized, for: .normal)
        obj.setupDefaultStyle()
        return obj
    }()
    
    let radialGradientView: RadialGradientView = {
        let obj = RadialGradientView()
        obj.alpha = 0.3
        obj.isHidden = true
        return obj
    }()
    
    let detailText: OnboardDetailLabel = {
        let obj = OnboardDetailLabel()
        obj.text = LocalizationKeys.onboardDetailFirst.rawValue.localized
        return obj
    }()
    
    private let versionText: OnboardVersionLabel = {
        let obj = OnboardVersionLabel()
        obj.text = LocalizationKeys.onboardVersionText.rawValue.localized
        return obj
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupBackground()
        setup()
        addToScrollView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBackground() {
        backgroundColor = UIColor(resource: .onboardingBackgroundGrayDarkBlue)
    }
    
    private func setup() {
        addSubview(radialGradientView)

        addSubview(logoImage)
        addSubview(versionText)
        


        addSubview(closeButton)
     
        addSubview(detailText)
        addSubview(onboardButton)
        addSubview(pageControl)
        
        addSubview(scrollView)
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        logoImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(33.sizeH)
            make.centerX.equalToSuperview()
            make.width.equalTo(48.sizeW)
            make.height.equalTo(15.sizeH)
        }
        
        radialGradientView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(323.sizeH)
        }
        
        closeButton.snp.makeConstraints { make in
            make.size.equalTo(27)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(27.sizeH)
            make.trailing.equalToSuperview().offset(-18.sizeW)
        }
        
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(5.sizeH)
            make.bottom.equalTo(onboardButton.snp.top).offset(-20.sizeH)
        }
        
        onboardButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(13.sizeW)
            make.height.equalTo(57.sizeH)
//            make.bottom.equalTo(versionText.snp.top).offset(-161.sizeH)
        }
        
        detailText.snp.makeConstraints { make in
            make.top.equalTo(onboardButton.snp.bottom).offset(20.sizeH)
            make.leading.trailing.equalToSuperview().inset(19.sizeW)
        }
        
        versionText.snp.makeConstraints { make in
            make.top.equalTo(onboardButton.snp.bottom).offset(161.sizeH)
            make.leading.trailing.equalToSuperview().inset(39.sizeW)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-10.sizeH)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(35.sizeH)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(pageControl.snp.top)
        }
    }
    
    private func constraintsUpdateForThidScreen() {
        logoImage.snp.updateConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(22.sizeH)
            make.width.equalTo(54.sizeW)
            make.height.equalTo(45.sizeH)
        }
        
        scrollView.snp.updateConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(16.sizeH)
        }
    }
    
    private func constraintsUpdateForFirstTwoScreens() {
        logoImage.snp.updateConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(33.sizeH)
            make.width.equalTo(48.sizeW)
            make.height.equalTo(15.sizeH)
        }
        
        scrollView.snp.updateConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(35.sizeH)
        }
    }
}

//MARK: - Adding views to the scroll view
extension OnboardingView {
    private func addToScrollView() {
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(firstScreen)
        stackView.addArrangedSubview(secondScreen)
        stackView.addArrangedSubview(thirdScreen)
    
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(scrollView.snp.height)
        }
        
        stackView.arrangedSubviews.forEach { view in
            view.snp.makeConstraints { make in
                make.width.equalTo(scrollView.snp.width)
            }
        }
    }
}

extension OnboardingView {
    func settingFirstTwoScreens(for pageNum: Double) {
        logoImage.image = UIImage(resource: .textLogo)
        constraintsUpdateForFirstTwoScreens()
        onboardButton.setupDefaultStyle()
        onboardButton.setTitle(LocalizationKeys.onboardNextButton.rawValue.localized, for: .normal)
        detailText.text = pageNum == 0.0 ? LocalizationKeys.onboardDetailFirst.rawValue.localized : LocalizationKeys.onboardDetailSecond.rawValue.localized
        radialGradientView.isHidden = true

    }
    
    func settingThirdScreen() {
        logoImage.image = UIImage(resource: .imageLogo)
        constraintsUpdateForThidScreen()
        onboardButton.setupGradientStyle()
        onboardButton.setTitle(LocalizationKeys.onboardSubmitButton.rawValue.localized, for: .normal)
        detailText.text = LocalizationKeys.onboardDetailThird.rawValue.localized
        radialGradientView.isHidden = false
        
        guard let textToEmphasize = detailText.text else {return}
        
        let attributedString = NSMutableAttributedString(string: textToEmphasize)
        let emphasizedWord = "79,99€ per year"
        let range = (textToEmphasize as NSString).range(of: emphasizedWord)
        
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: detailText.font.pointSize + 2, weight: .bold), range: range)
        attributedString.addAttribute(.foregroundColor, value: UIColor(resource: .mainTextDarkBlueWhite), range: range)
        
        detailText.attributedText = attributedString
    }
}


