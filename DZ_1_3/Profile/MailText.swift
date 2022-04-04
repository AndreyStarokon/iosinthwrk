//
//  mailTextField.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 27.03.2022.
//

import Foundation
import UIKit



class MailTextField: UITextField, UITextFieldDelegate {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func configure() {
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray.cgColor
        textColor = .black
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        leftViewMode = .always
        clearButtonMode = .always
        delegate = self
        returnKeyType = .done
        placeholder = "enter mail"
        font = UIFont(name: "Apple SD Ghotic Neo", size: 20)
        tintColor = .systemGray6
        autocapitalizationType = .none
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
