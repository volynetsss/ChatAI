import Foundation
import UIKit
import SnapKit

class ChatsListView: UIView {
    let headerContainer: UIStackView = {
        let obj = UIStackView()
        obj.axis = .horizontal
        obj.spacing = 8
        obj.alignment = .center
        return obj
    }()
    
    let logoLabel: UILabel = {
        let obj = UILabel()
        obj.font = .Poppins.semiBold(size: 23).font
        obj.text = LocalizationKeys.chatsScreenTitle.rawValue.localized
        obj.textColor = UIColor(resource: .labelWhiteBlack)
        return obj
    }()
    
    let smallLogoImage: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(resource: .smallIconLogo)
        obj.contentMode = .scaleAspectFill
        return obj
    }()
    
    let iconSearchField: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(resource: .searchIcon)
        obj.contentMode = .scaleAspectFit
        return obj
    }()
    
    let containerIcon: UIView = {
        let obj = UIView()
        return obj
    }()
    
    let placeholderLabel: UILabel = {
        let obj = UILabel()
        obj.font = .SfProText.regular(size: 16).font
        obj.text = LocalizationKeys.chatsScreenSearchFieldPlaceholder.rawValue.localized
        obj.textColor = UIColor(resource: .labelWhiteBlack)
        obj.alpha = 0.35
        return obj
    }()
    
    let searchField: UITextField = {
        let obj = UITextField()
        obj.backgroundColor = UIColor(resource: .searchFieldGrayDarkBlue)
        obj.layer.cornerRadius = 18.0
        obj.textColor = UIColor(resource: .labelWhiteBlack)
        obj.layer.masksToBounds = true
        obj.returnKeyType = .done
        obj.clearButtonMode = .whileEditing
        return obj
    }()
    
    let tableView: UITableView = {
        let obj = UITableView()
        obj.backgroundColor = .clear
        obj.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: CGFloat(60.0), right: 0)
        return obj
    }()
    
    let blurBottomContainer: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .regular)
        let obj = UIVisualEffectView(effect: blurEffect)
        obj.backgroundColor = UIColor(resource: .viewBottomBackgroundGrayDarkBlue)
        obj.alpha = 0.9
        return obj
    }()
    
    let borderView: UIView = {
        let obj = UIView()
        obj.backgroundColor = UIColor(resource: .viewBottomBorderGrayDarkBlue)
        return obj
    }()
    
    let addNewChatButton: UIButton = {
        let obj = UIButton()
        obj.setImage(UIImage(resource: .newChatBtn), for: .normal)
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
    
    private func setup() {
        addSubview(headerContainer)
        headerContainer.addArrangedSubview(smallLogoImage)
        headerContainer.addArrangedSubview(logoLabel)
        
        addSubview(searchField)
        
        containerIcon.addSubview(iconSearchField)
        
        searchField.addSubview(placeholderLabel)
        addSubview(tableView)
        
        addSubview(blurBottomContainer)
        addSubview(borderView)
        blurBottomContainer.contentView.addSubview(addNewChatButton)
        
        makeConstraints()
        
        searchField.leftView = containerIcon
        searchField.leftViewMode = .always
    }
    
    private func makeConstraints() {
        headerContainer.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20.sizeH)
            make.centerX.equalToSuperview()
        }
        
        smallLogoImage.snp.makeConstraints { make in
            make.width.equalTo(22.sizeW)
            make.height.equalTo(18.sizeH)
        }
        
        searchField.snp.makeConstraints { make in
            make.top.equalTo(headerContainer.snp.bottom).offset(11.sizeH)
            make.leading.trailing.equalToSuperview().inset(16.sizeW)
            make.height.equalTo(40.sizeH)
        }
        
        containerIcon.snp.makeConstraints { make in
            make.height.equalTo(17.sizeW)
            make.width.equalTo(45.sizeW)
        }
        
        iconSearchField.snp.makeConstraints { make in
            make.size.equalTo(17.sizeW)
            make.leading.equalToSuperview().offset(20.sizeW)
        }
        
        placeholderLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchField.snp.bottom).offset(11.sizeH)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        blurBottomContainer.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(addNewChatButton.snp.top).offset(-14.sizeH)
        }
        
        borderView.snp.makeConstraints { make in
            make.bottom.equalTo(blurBottomContainer.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(0.4)
        }
        
        addNewChatButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-10.sizeH)
        }
    }
}

//MARK: - setting background of the view
extension ChatsListView {
    private func setupBackground() {
        backgroundColor = UIColor(resource: .backgroundWhiteDarkBlue)
    }
}
