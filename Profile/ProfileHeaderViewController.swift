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
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews() {
        
        self.addSubview(profileImage)
        self.addSubview(statusButton)
        self.addSubview(nameBar)
        self.addSubview(statusText)
        
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    private let profileImage: UIImageView = {
        let image =  UIImageView()
        image.image = UIImage(named: "2764195349")
        image.frame = CGRect(x: 16, y: 102, width: 120, height: 120)
        image.layer.cornerRadius = (image.frame.size.width) / 2;
        image.layer.borderWidth = 3
        image.layer.borderColor = .init(gray: 5, alpha: 4)
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = true
        
                return image
    }()
    private let statusText: UITextField = {
        let statusText = UITextField()
        statusText.frame = CGRect(x: 150, y: 122, width: 200, height: 18)
        statusText.text = "слушает музыку..."
        statusText.textColor = .gray
        statusText.font = .boldSystemFont(ofSize: 14)
        statusText.backgroundColor = .lightGray
        statusText.addTarget(self, action: #selector(buttonPressed), for: .editingChanged)
        return statusText
    }()
    private let nameBar: UITextField = {
        let text = UITextField()
        text.frame = CGRect(x: 150, y: 102, width: 200, height: 18)
        text.text = "хипстер кот"
        text.backgroundColor = .lightGray
        text.textColor = .black
        
        return text
    }()
    let statusButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.backgroundColor = .systemBlue
        button.frame = CGRect(x: 16, y: 234, width: 350, height: 50)
        button.setTitle("Status", for: .normal)
        button.layer.shadowOffset = .init(width: 4, height: 4)
        button.layer.shadowOpacity = 1.0;
        button.layer.shadowRadius = 4;
        button.translatesAutoresizingMaskIntoConstraints = true
        return button
    }()
    @objc func buttonPressed() {
        print("\(String(describing: statusText.text!))")
    }
       
    @objc func statusTextChanged (_ textField: UITextField){
        let newStatus = UITextField()
        newStatus.frame = CGRect(x: 150, y: 200, width: 200, height: 40)
        newStatus.placeholder = "новый статус"
        newStatus.backgroundColor = .white
        newStatus.layer.cornerRadius = 16
        newStatus.layer.borderWidth = 1
        newStatus.font = .boldSystemFont(ofSize: 16)
        
    }
}
        
//extension ProfileHeaderView {
  //  func setConstraints() {
        
    //    NSLayoutConstraint.activate([
      //      statusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        //    statusButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
          //  statusButton.heightAnchor.constraint(equalToConstant: 70),
            //statusButton.widthAnchor.constraint(equalToConstant: 300)])

   // }
//}
