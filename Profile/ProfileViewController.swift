//
//  SecondViewController.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 06.03.2022.
//
import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Профиль"
        profileHeaderView.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        viewConstraint()
        
    }
    private func viewConstraint() {
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 750)
            ])
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
       
    
        
    }
}


