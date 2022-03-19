//
//  ViewController.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 05.03.2022.
//

import UIKit


var post = Post(title: "заголовок")
class FeedViewController: UIViewController {

    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 650, width: 200, height: 52))
        button.setTitle("Показать пост", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Лента"
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonShowPost), for: .touchUpInside)
        

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
    }
    
    @objc  func buttonShowPost() {
        let pcView = PostViewController()
        pcView.view.backgroundColor = .yellow
        pcView.title = post.title
        navigationController?.pushViewController(pcView, animated: true)
        //создание контроллера
    }
}

