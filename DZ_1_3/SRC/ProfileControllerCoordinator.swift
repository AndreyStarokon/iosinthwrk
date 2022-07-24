//
//  ProfileControllerCoordinator.swift
//  VK_app
//
//  Created by Ffhh Qerg on 28.06.2022.
//

import Foundation
import UIKit

class ProfileCoordinator: Coordinator {
    var tabBarController: UITabBarController?
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController, tabBarController: UITabBarController?) {
        self.navigationController = navigationController
        self.tabBarController = tabBarController
    }
    
    func loginButtonPressed() {
        let profileVc = ProfileViewController()
            profileVc.coordinator = self
        navigationController?.pushViewController(profileVc, animated: true)
        
        }
    
    func photosSelected() {
        let photosViewController = PhotosViewController()
        navigationController?.pushViewController(photosViewController, animated: true)
    }

    func closeButtonPressed() {
               navigationController?.popViewController(animated: true)
        }
    
    func showAlert(error: Errors) {
            
                    var message = ""
                    switch error {
                    case .incorrectData:
                        message = "Введены неверные данные. Проверьте введённые данные"
                    case .shortPassword:
                        message = "Пароль должен содержать минимум 6 символов"
                    case .incorrectEmail:
                        message = "Логин не соответсвует адресу почты"
                    }

                   let alert = UIAlertController(title: "error", message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        navigationController?.present(alert, animated: true, completion: nil)
    }
}
