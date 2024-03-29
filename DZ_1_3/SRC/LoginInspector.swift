//
//  LoginInspector.swift
//  VK_app
//
//  Created by Ffhh Qerg on 10.06.2022.
//

import Foundation
import RealmSwift

enum Errors: Error {
    case incorrectData
    case shortPassword
    case incorrectEmail
}


@objcMembers class CachedUser: Object {
    dynamic var id: String?
    dynamic var login: String?
    dynamic var password: String?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}


class LoginInspector: LoginViewControllerDelegate {
   
    
    func checkUsers() -> [User] {
        return realm?.objects(CachedUser.self).compactMap {
            guard let id = $0.id, let login = $0.login, let password = $0.password else { return nil }
            return User(id: id, login: login, password: password)
        } ?? []
    }
    
    
    func creteUser(id: String, email: String?, pass: String?, failure: @escaping (Errors) -> Void) -> Bool {
        if email == nil || email == "" {
            failure(.incorrectData)
            return false
        } else if pass == nil || pass == ""{
            failure(.incorrectData)
            return false
        } else if pass!.count < 6 {
            failure(.shortPassword)
            return false
        } else {
            let user = CachedUser()
            user.id = id
            user.login = email
            user.password = pass
            
            try? realm?.write {
                realm?.add(user)
            }
            return true
        }
    }
    
    private var realm: Realm? {
        return try? Realm()
    }
    func checkLogin(userLogin: String) -> Bool {
         return Checker.shared.check(userLogin: userLogin, userPass: nil)
     }
     
     func checkPass(userPass: String) -> Bool {
         return Checker.shared.check(userLogin: nil, userPass: userPass)
     }
 }
