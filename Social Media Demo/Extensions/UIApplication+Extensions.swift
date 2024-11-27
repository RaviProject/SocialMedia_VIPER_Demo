//
//  UIApplication+Extensions.swift
//  Quid
//
//  Created by Ravi Dhaduk on 16/07/24.
//

import Foundation
import UIKit

extension UIApplication {
    
    // Return visible screen
    class func topViewController(base: UIViewController? = UIApplication.shared.windows[0].rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(base: selected)
        } else if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
