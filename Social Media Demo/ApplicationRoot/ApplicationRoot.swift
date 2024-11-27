import UIKit

class ApplicationRoot: NSObject {
    
    static let shared = ApplicationRoot()
    
    fileprivate var notificationCenter: NotificationCenter
    fileprivate let appDelegate = AppDelegate.shared
    
    override init() {
        notificationCenter = NotificationCenter.default
        super.init()
        self.setupAppearance()
    }
    
    fileprivate func setupAppearance() {
        let generalAppearance = UINavigationBar.appearance()
        generalAppearance.clipsToBounds = false
        generalAppearance.setBackgroundImage(UIImage(), for: .default)
        generalAppearance.shadowImage = UIImage()
        generalAppearance.isTranslucent = true
    }
    
    func SetupRootViewController() {
        let controller = HomeFactory.shared.createModule()
        let navigationViewController = AppNavigationController.init()
        navigationViewController.viewControllers = [controller]
        navigationViewController.isNavigationBarHidden = true
        APP_DELEGATE.appNavigation = navigationViewController
        AppDelegate.shared.window?.rootViewController = navigationViewController
        AppDelegate.shared.window?.makeKeyAndVisible()
    }
}

extension ApplicationRoot {
    @objc func didUserLogOut() {
        NSLog("AppRoot->didUserLogOut")
    }
}
