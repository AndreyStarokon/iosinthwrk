//
//  PostViewController.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 16.03.2022.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "\u{2699}", style: .plain, target: self, action: #selector(didTap))
        
    }
    @objc  func didTap() {
        let pcView = InfoViewController()
        let navVC = UINavigationController(rootViewController: pcView)
        present(navVC, animated: true)
  }
}
