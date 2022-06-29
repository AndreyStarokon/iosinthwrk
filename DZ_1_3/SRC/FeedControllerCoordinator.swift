//
//  FeedControllerCoordinator.swift
//  VK_app
//
//  Created by Ffhh Qerg on 28.06.2022.
//

import Foundation
import UIKit

class FeedCoordinator: Coordinator {
    var tabBarController: UITabBarController?
    var navigationController: UINavigationController?
    var infoVC: InfoViewController?
    
    init(navigationController: UINavigationController, tabBarController: UITabBarController?) {
        self.navigationController = navigationController
        self.tabBarController = tabBarController
    }
    
    func showPost() {
        let controller = PostViewController()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func infoPresent() {
        infoVC = InfoViewController()
        infoVC?.coordinator = self
        navigationController?.present(infoVC!, animated: true)
    }
}
