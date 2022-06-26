//
//  LoginInspector.swift
//  VK_app
//
//  Created by Ffhh Qerg on 10.06.2022.
//

import Foundation


class LoginInspector: LoginViewControllerDelegate {
    
    func checkLogin(userLogin: String) -> Bool {
        return Checker.shared.check(userLogin: userLogin, userPass: nil)
    }
    
    func checkPass(userPass: String) -> Bool {
        return Checker.shared.check(userLogin: nil, userPass: userPass)
    }
}
