//
//  PasswordText.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 28.03.2022.
//

import UIKit

class PasswordTextField: UITextField, UITextFieldDelegate {
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
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray.cgColor
        textColor = .black
        delegate = self
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        leftViewMode = .always
        clearButtonMode = .always
        returnKeyType = .done
        placeholder = "enter password"
        font = UIFont(name: "Apple SD Ghotic Neo", size: 20)
        tintColor = .systemGray6
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        isSecureTextEntry = true
        autocapitalizationType = .none
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
}
