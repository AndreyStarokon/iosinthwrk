//
//  PostViewController.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 16.03.2022.
//

import UIKit

class PostViewController: UIViewController {

    var coordinator: FeedCoordinator?
    
    private func setupView() {
            view.backgroundColor = .white
            let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTap))
            navigationItem.rightBarButtonItems = [add]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Post"
        view.backgroundColor = .white
        setupView()
    }
    @objc  func didTap() {
        let infoVc = InfoViewController()
        navigationController?.present(infoVc, animated: true)
  }
}
