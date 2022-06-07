//
//  CurrentUserService.swift
//  StorageService
//
//  Created by Ffhh Qerg on 01.06.2022.
//

import UIKit

struct someUser{
    static let fullName = "Ivan Ivanov"
    static let avatar = "avatar"
    static let status = "слушает музыку..."
}

protocol UserService {
    
    func getUserName (loginName: String) -> User?
    
}

final class User {
    
    var fullName: String
    var avatar: String
    var status: String
    init (fullName: String, avatar: String, status: String){
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }    
}

final class CurrentUserService: UserService {

    private let user: User
    init() {
        self.user = User(fullName: someUser.fullName, avatar: someUser.avatar, status: someUser.status)
    }
    func getUserName(loginName: String) -> User? {
        if loginName == user.fullName  {
            return user
        }
        return nil
    }
}



final class TestUserService: UserService {
    func getUserName(loginName: String) -> User? {
        return User(fullName: "хипстер кот", avatar: "2764195349", status: someUser.status )
    }
}
