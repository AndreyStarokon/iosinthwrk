//
//  ProfileHeaderViewController.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 13.03.2022.
//

import UIKit

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
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    private let profileImage: UIImageView = {
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
    private let statusText: UILabel = {
        let statusText = UILabel()
        statusText.text = "слушает музыку..."
        statusText.textColor = .gray
        statusText.font = .systemFont(ofSize: 14, weight: .regular)
        statusText.translatesAutoresizingMaskIntoConstraints = false
        return statusText
    }()
    private let nameBar: UILabel = {
        let text = UILabel()
        text.text = "хипстер кот"
        text.font = .systemFont(ofSize: 16, weight: .bold)
        text.backgroundColor = .lightGray
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .black
        
        return text
    }()
   private let changeStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Change Status", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let statusButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.backgroundColor = .systemBlue
        button.setTitle("Status", for: .normal)
        button.layer.shadowOffset = .init(width: 4, height: 4)
        button.layer.shadowOpacity = 1.0;
        button.layer.shadowRadius = 4;
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    @objc func buttonPressed() {
        print("\(String(describing: statusText.text!))")
    }
       
    @objc func statusTextChanged (_ textField: UITextField){
        let newStatus = UITextField()
        newStatus.placeholder = "новый статус"
        newStatus.backgroundColor = .white
        newStatus.layer.cornerRadius = 16
        newStatus.layer.borderWidth = 1
        newStatus.font = .boldSystemFont(ofSize: 16)
        
    }
}
        
extension ProfileHeaderView {
   func setConstraints() {
       self.addSubview(statusButton)
       self.addSubview(profileImage)
       self.addSubview(statusText)
       self.addSubview(nameBar)
       self.addSubview(changeStatusButton)
       
       NSLayoutConstraint.activate([
       profileImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -250),
       profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
       profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
       profileImage.heightAnchor.constraint(equalToConstant: 120 )
       ])
   
       NSLayoutConstraint.activate([
       statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
       statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
       statusButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16),
       statusButton.heightAnchor.constraint(equalToConstant: 50),
       ])
       
       NSLayoutConstraint.activate([
        changeStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
        changeStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
        changeStatusButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        changeStatusButton.heightAnchor.constraint(equalToConstant: 50),
       ])
       
       NSLayoutConstraint.activate([
       statusText.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34),
       statusText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150),
       statusText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
       ])
       
       NSLayoutConstraint.activate([
       nameBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
       nameBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -150),
       nameBar.heightAnchor.constraint(equalToConstant: 18)
       ])
       
    }
}
