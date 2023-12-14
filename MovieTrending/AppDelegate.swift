//
//  AppDelegate.swift
//  MovieTrending
//
//  Created by Phincon on 13/12/23.
//

import UIKit
import Kingfisher
import netfox

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Create the main window and set up the root view controller
        NFX.sharedInstance().start()
        let window = UIWindow(frame: UIScreen.main.bounds)
        let mainViewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: mainViewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        // Set the window property and configure Kingfisher
        self.window = window
        configureKingfisher()
        
        return true
    }
    
    // MARK: - Configuration
    
    func configureKingfisher() {
        // Kingfisher configuration with options
        let kingfisherOptions: KingfisherOptionsInfo = [
            .processor(DownsamplingImageProcessor(size: CGSize(width: 200, height: 200))),
            .scaleFactor(UIScreen.main.scale),
            .cacheOriginalImage
        ]

        KingfisherManager.shared.defaultOptions = kingfisherOptions
    }
}
