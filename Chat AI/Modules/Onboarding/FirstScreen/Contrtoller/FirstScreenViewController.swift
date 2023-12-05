import Foundation
import UIKit

class FirstScreenViewController: UIViewController {
    private let mainView = FirstScreenView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
