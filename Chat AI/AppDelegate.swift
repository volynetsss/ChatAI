import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        let navigation =  UINavigationController(rootViewController: FirstScreenViewController())
        navigation.isNavigationBarHidden = true
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
               

        return true
    }

}

