//
//  ModelCheck.swift
//  VK_app
//
//  Created by Ffhh Qerg on 25.06.2022.
//

import Foundation

class ModelCheck {
    let password = "123321"
    
    func check(inputWord: String){
        if inputWord == password  {
            NotificationCenter.default.post(name: NSNotification.Name.greenLable, object: nil)
        } else {
            NotificationCenter.default.post(name: NSNotification.Name.redLable, object: nil)
        }
    }
}
