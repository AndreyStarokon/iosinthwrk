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
        view.addSubview(profileHeaderView)
    title = "Профиль"
        profileHeaderView.backgroundColor = .lightGray
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.profileHeaderView.frame = self.view.frame
    
        
    }
}
