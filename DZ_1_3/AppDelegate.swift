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
       
    
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
            let tabBarVC = UITabBarController()
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.makeKeyAndVisible()
            window?.rootViewController = tabBarVC
            
            let firstVC = LogInViewController()
            firstVC.delegate = LoginInspector()
            let firstNavController = UINavigationController(rootViewController: firstVC)
                  
            firstVC.tabBarItem = UITabBarItem(title: "pofile", image: UIImage(systemName: "person"), tag: 0)
            
            let secondVC = FeedViewController()
       
            let secondNavController = UINavigationController(rootViewController: secondVC)
            secondVC.tabBarItem = UITabBarItem(title: "feed", image: UIImage(systemName: "house"), tag: 1)
            
            tabBarVC.viewControllers = [firstNavController, secondNavController]
            UITabBar.appearance().backgroundColor = .white
            if #available(iOS 13.0, *) {
                        let navBarAppearance = UINavigationBarAppearance()
                        navBarAppearance.configureWithOpaqueBackground()
                        navBarAppearance.backgroundColor = UIColor.white
                        secondNavController.navigationBar.standardAppearance = navBarAppearance
                        secondNavController.navigationBar.scrollEdgeAppearance = navBarAppearance
                    } else {
                        secondNavController.edgesForExtendedLayout = []
                    }
       
        return true
    }
}
 

