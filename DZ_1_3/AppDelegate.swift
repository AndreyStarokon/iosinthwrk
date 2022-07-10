//
//  AppDelegate.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 05.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

             
        var window: UIWindow?
        var coordinator: MainCoordinator?
    
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            let tabController = UITabBarController()
            
            window = UIWindow(frame: UIScreen.main.bounds)
            coordinator = MainCoordinator(navigationController: nil, tabBarController: tabController)
                    coordinator?.start()

                    window?.rootViewController = tabController
                    window?.makeKeyAndVisible()
            
        return true
    }
}
 

