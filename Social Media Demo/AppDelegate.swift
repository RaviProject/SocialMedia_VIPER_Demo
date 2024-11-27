//
//  AppDelegate.swift
//  Social Media Demo
//
//  Created by Ravi Dhaduk on 27/11/24.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var appNavigation : AppNavigationController!
    
    class var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        ApplicationRoot.shared.SetupRootViewController()
        return true
    }

}

