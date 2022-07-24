//
//  AppDelegate.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 05.03.2022.
//

import UIKit
import Foundation
import FirebaseCore
import FirebaseAuth

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
             
        var window: UIWindow?
        var coordinator: MainCoordinator?
    
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            let tabController = UITabBarController()
            

            
            window = UIWindow(frame: UIScreen.main.bounds)
            coordinator = MainCoordinator(navigationController: nil, tabBarController: tabController)
                    coordinator?.start()
            FirebaseApp.configure()
                    window?.rootViewController = tabController
                    window?.makeKeyAndVisible()
            
            let appConfig = AppConfiguration.random(people: URL(string: "https://swapi.dev/api/people/8")!, starships: URL(string: "https://swapi.dev/api/starships/3")!, planet: URL(string: "https://swapi.dev/api/planets/5")!)
                   
                   switch appConfig {
                   case .people(let people):
                       NetworkManager.dataTask(url: people)
                   case .starships(let starsip):
                       NetworkManager.dataTask(url: starsip)
                   case .planets(let planet):
                       NetworkManager.dataTask(url: planet)
                   }
                   
            
        return true
    }
    
}
 

