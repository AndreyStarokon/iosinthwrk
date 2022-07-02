//
//  Cheker.swift
//  VK_app
//
//  Created by Ffhh Qerg on 10.06.2022.
//

import Foundation

struct Checker {
    static let shared = Checker()
   private let login = "Andrey"
   private let password = "Starokon"
    
    private init() {
        
    }
    
    func check(userLogin: String?, userPass: String?) -> Bool {
        if userLogin == login && userPass == password {
            return true
        }
        else {
            return false
        }
    }
}
