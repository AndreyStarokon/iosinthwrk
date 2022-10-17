//
//  AppDelegate.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 05.03.2022.
//

import UIKit
import Foundation
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
        private(set) lazy var coreDataStack = CoreDataStack()
        var window: UIWindow?
        var coordinator: MainCoordinator?
        private let localNotificationsService = LocalNotificationsService()
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            let tabController = UITabBarController()
            

            //
            window = UIWindow(frame: UIScreen.main.bounds)
            coordinator = MainCoordinator(navigationController: nil, tabBarController: tabController, stack: coreDataStack)
                    coordinator?.start()
           
                    window?.rootViewController = tabController
                    window?.makeKeyAndVisible()
            
            localNotificationsService.sendNotification()
            localNotificationsService.registerForLatestUpdatesIfPossible()

                   
            
        return true
    }
    func saveContext () {
            let context = coreDataStack.persistentContainer.viewContext
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        }
    
}
 

