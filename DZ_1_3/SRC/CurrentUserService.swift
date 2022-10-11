//
//  CurrentUserService.swift
//  StorageService
//
//  Created by Ffhh Qerg on 01.06.2022.
//

import UIKit


struct User {
    var id: String
    var login: String
    var password: String
    
    init(id: String, login: String, password: String) {
        self.id = id
        self.login = login
        self.password = password
    }
}

