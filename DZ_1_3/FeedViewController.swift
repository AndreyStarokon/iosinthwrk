//
//  ViewController.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 05.03.2022.
//

import UIKit



class FeedViewController: UIViewController {

    private let stackView: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .white
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        
        return stack
    }()
    private let buttonOne: UIButton = {
        let button = UIButton()
        button.setTitle("Показать пост", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 16
        button.layer.shadowOffset = .init(width: 4, height: 4)
        button.layer.shadowOpacity = 1.0;
        button.layer.shadowRadius = 4;
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    private let buttonTwo: UIButton = {
        let button = UIButton()
        button.setTitle("Показать пост", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 16
        button.layer.shadowOffset = .init(width: 4, height: 4)
        button.layer.shadowOpacity = 1.0;
        button.layer.shadowRadius = 4;
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Лента"
       setupLayer()
        buttonOne.addTarget(self, action: #selector(buttonShowPost), for: .touchUpInside)
        buttonTwo.addTarget(self, action: #selector(buttonShowPost), for: .touchUpInside)

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
    }
    private func setupLayer() {
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 150),
            stackView.widthAnchor.constraint(equalToConstant: 300)
        ])
        stackView.addArrangedSubview(buttonOne)
        stackView.addArrangedSubview(buttonTwo)
    }
    @objc  func buttonShowPost() {
        let pcView = PostViewController()
        pcView.view.backgroundColor = .yellow
        pcView.title = "пост"
        navigationController?.pushViewController(pcView, animated: true)
        //создание контроллера
    }
}

