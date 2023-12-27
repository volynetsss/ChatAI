import Foundation
import UIKit

class OnboardingViewController: UIViewController {
    private let mainView = OnboardingView()
    var pageNumber = 0.0
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViewController()
    }
    
    private func initViewController() {
        mainView.scrollView.delegate = self
        initButton()
    }
}

//MARK: - init buttons
extension OnboardingViewController {
    private func initButton() {
        mainView.onboardButton.addTarget(self, action: #selector(didTapOnboardButton), for: .touchUpInside)
        mainView.closeButton.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)

    }
}

//MARK: - actions
extension OnboardingViewController {
    @objc
    private func didTapOnboardButton() {
        let nextPage = min(pageNumber + 1, mainView.scrollView.contentSize.width / mainView.scrollView.frame.width - 1)
        let nextPageOffset = CGPoint(x: nextPage * mainView.scrollView.frame.width, y: 0)
        
        mainView.scrollView.setContentOffset(nextPageOffset, animated: true)
    }
    
    @objc
    private func didTapCloseButton() {
        openHomeController()
    }
}

//MARK: - navigation
extension OnboardingViewController {
    private func openHomeController() {
        let homeViewController = ChatsListViewController()
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
}

//MARK: - setting page control
extension OnboardingViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageNumber = round(mainView.scrollView.contentOffset.x / mainView.scrollView.frame.size.width)
        mainView.pageControl.currentPage = Int(pageNumber)
        
        editLayout(for: pageNumber)
    }
}

//MARK: - edit layout for pages
extension OnboardingViewController {
    private func editLayout(for pageNum: Double) {
        switch(pageNum) {
        case 0.0:
            mainView.settingFirstTwoScreens(for: pageNum)
        case 1.0:
            mainView.settingFirstTwoScreens(for: pageNum)
        case 2.0:
            mainView.settingThirdScreen()
        default:
            break
        }
    }
}




