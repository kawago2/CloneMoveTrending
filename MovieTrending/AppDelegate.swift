//
//  AppDelegate.swift
//  MovieTrending
//
//  Created by Phincon on 13/12/23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        let vc = MainViewController()
        let navigatorController = UINavigationController(rootViewController: vc)
        window.rootViewController = navigatorController
        window.makeKeyAndVisible()
        
        self.window = window
        return true
    }
}

