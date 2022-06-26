//
//  ProfileHeaderViewController.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 13.03.2022.
//

import UIKit
import SnapKit


class ProfileHeaderView: UIView {
    override init(frame: CGRect) {
    super.init(frame: frame)
        setupViews()
        setConstraints()
       
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews() {
       
    }
     let profileImage: UIImageView = {
        let image =  UIImageView()
        image.image = UIImage(named: "2764195349")
        image.frame = CGRect(x: 16, y: 102, width: 120, height: 120)
        image.layer.cornerRadius = (image.frame.width) / 2;
        image.layer.borderWidth = 3
        image.layer.borderColor = .init(gray: 5, alpha: 4)
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
     let statusText: UILabel = {
        let statusText = UILabel()
        statusText.text = "слушает музыку..."
        statusText.textColor = .gray
        statusText.font = .systemFont(ofSize: 14, weight: .regular)
        statusText.translatesAutoresizingMaskIntoConstraints = false
        return statusText
    }()
     lazy var nameBar: UILabel = {
        let text = UILabel()
        text.text = "хипстер кот"
        text.font = .systemFont(ofSize: 16, weight: .bold)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .black
        
        return text
    }()
    let statusTextField: UITextField = {
        let newStatus = UITextField()
        newStatus.backgroundColor = .white
        newStatus.isHidden = true
        newStatus.layer.cornerRadius = 12
        newStatus.layer.borderWidth = 1
        newStatus.layer.borderColor = UIColor.black.cgColor
        newStatus.textColor = .black
        newStatus.leftViewMode = .always
        newStatus.clearButtonMode = .always
        newStatus.returnKeyType = .done
        newStatus.placeholder = " new status"
        newStatus.font = UIFont(name: "Apple SD Ghotic Neo", size: 15)
        newStatus.tintColor = .systemGray6
        
        newStatus.autocapitalizationType = .none
        newStatus.translatesAutoresizingMaskIntoConstraints = false
        return newStatus
    }()
  
    private lazy var statusButton = CustomButton(title: "Status", color: .systemBlue, colorTitle: .white, borderWidth: 0.5, cornerRadius: 16) {
        self.statusTextField.isHidden = false
    }
   
}
        
extension ProfileHeaderView {
   func setConstraints() {
       self.addSubview(statusButton!)
       self.addSubview(profileImage)
       self.addSubview(statusText)
       self.addSubview(nameBar)
       self.addSubview(statusTextField)
       
       profileImage.snp.makeConstraints { make in
           make.right.equalToSuperview().inset(250)
           make.left.equalToSuperview().inset(16)
           make.top.equalToSuperview().inset(16)
           make.height.equalTo(120)
       }
       statusTextField.snp.makeConstraints { make in
           make.left.equalToSuperview().inset(150)
           make.right.equalToSuperview().inset(16)
           make.bottom.equalTo(statusButton!.snp_topMargin).inset(-20)
           make.height.equalTo(40)
       }
       
       statusButton!.snp.makeConstraints { make in
           make.left.equalToSuperview().inset(16)
           make.right.equalToSuperview().inset(16)
           make.top.equalTo(profileImage.snp_bottomMargin).inset(-16)
           make.height.equalTo(50)
       }
       
       statusText.snp.makeConstraints { make in
           make.top.equalTo(nameBar.snp_bottomMargin).inset(10)
           make.bottom.equalTo(statusButton!.snp_topMargin).inset(-34)
           make.right.equalToSuperview().inset(16)
           make.left.equalToSuperview().inset(150)
           
       }
       
       nameBar.snp.makeConstraints { make in
           make.right.equalToSuperview().inset(27)
           make.left.equalToSuperview().inset(150)
           make.top.equalToSuperview().inset(27)
           make.height.equalTo(18)
       }
    }
}

