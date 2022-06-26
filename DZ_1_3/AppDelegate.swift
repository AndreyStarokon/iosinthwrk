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
            let myFactory = MyLoginFactory()
            let modelCheck = ModelCheck()
            
            let firstVC = LogInViewController()
            
            firstVC.delegate = myFactory.factory()
            let firstNavController = UINavigationController(rootViewController: firstVC)
                  
            firstVC.tabBarItem = UITabBarItem(title: "pofile", image: UIImage(systemName: "person"), tag: 0)
            let secondVC = FeedViewController(modelCheck: modelCheck)
       
            let secondNavController = UINavigationController(rootViewController: secondVC)
            secondVC.tabBarItem = UITabBarItem(title: "feed", image: UIImage(systemName: "house"), tag: 1)
            
            tabBarVC.viewControllers = [firstNavController, secondNavController]
            UITabBar.appearance().backgroundColor = .white
            
        return true
    }
}
 

