//
//  LoginFactory.swift
//  VK_app
//
//  Created by Ffhh Qerg on 13.06.2022.
//

import Foundation
import UIKit


protocol LoginFactory {
    func factory() -> LoginInspector
}


class MyLoginFactory: LoginFactory {
    func factory() -> LoginInspector {
       return LoginInspector()
    }
}
