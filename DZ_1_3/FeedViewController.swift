//
//  ViewController.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 05.03.2022.
//

import UIKit

struct Post {
 var title: String
}
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
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
    }
    
    @objc  func didTap() {
        let pcView = PostViewController()
        pcView.view.backgroundColor = .yellow
        pcView.title = post.title
        navigationController?.pushViewController(pcView, animated: true)
        //создание контроллера
    }
}


class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "\u{2699}", style: .plain, target: self, action: #selector(didTap))
        
    }
    @objc  func didTap() {
        let pcView = InfoViewController()
        let navVC = UINavigationController(rootViewController: pcView)
    //    navigationController?.pushViewController(pcView, animated: true)
       present(navVC, animated: true)
  }
}
class InfoViewController: UIViewController{
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 650, width: 200, height: 52))
        button.setTitle("Показать алерт", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        view.addSubview(button)
        button.addTarget(self, action: #selector(doTap), for: .touchUpInside)
        

    }
   override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
}
    @objc func doTap() {
        let alert = UIAlertController(title: "My Alert", message: "какой-то аллерт", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("отмена", comment: "2"), style: .cancel, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
