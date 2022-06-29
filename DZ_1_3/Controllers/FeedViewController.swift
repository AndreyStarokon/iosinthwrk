//
//  ViewController.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 05.03.2022.
//

import UIKit



class FeedViewController: UIViewController {
    var coordinator: FeedCoordinator?
        var output: FeedViewOutput?

    private let stackView: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .white
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        
        return stack
    }()
    private lazy var word: UITextField = {
        let word = UITextField()
        word.backgroundColor = .white
        word.layer.cornerRadius = 12
        word.layer.borderWidth = 1
        word.layer.borderColor = UIColor.black.cgColor
        word.textColor = .black
        word.leftViewMode = .always
        word.clearButtonMode = .always
        word.returnKeyType = .done
        word.placeholder = " "
        word.font = UIFont(name: "Apple SD Ghotic Neo", size: 15)
        word.tintColor = .systemBlue
        
        word.autocapitalizationType = .none
        word.translatesAutoresizingMaskIntoConstraints = false
        return word
    }()

    private lazy var wordCheck = CustomButton(title: "проверка пароля", color: UIColor(named: "MainColor") ?? .systemBlue, colorTitle: .white, borderWidth: 0, cornerRadius: 10) {
            if self .word.text != ""{
                self.modelCheck.check(inputWord: self.word.text!)
            } else {
                self.word.placeholder = "Введите пароль"
            }
        }
    private lazy var buttonOne = CustomButton(title: "показать пост 1", color: .systemBlue, colorTitle: .black, borderWidth: 1, cornerRadius: 10){ self.navigationController?.pushViewController(PostViewController(), animated: true)}
    private lazy var buttonTwo = CustomButton(title: "показать пост 2", color: .systemBlue, colorTitle: .black, borderWidth: 1, cornerRadius: 10){ self.navigationController?.pushViewController(PostViewController(), animated: true)}
    
    
    private let modelCheck: ModelCheck
        init (modelCheck: ModelCheck, output: FeedViewOutput) {
            self.modelCheck = modelCheck
            self.output = output
            
            super.init(nibName: nil, bundle: nil)
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
   
       
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Лента"
        output?.coordinator = self.coordinator
        setupLayer()
        NotificationCenter.default.addObserver(self,selector:#selector(redLable),name:Notification.Name.redLable,object: nil)
        NotificationCenter.default.addObserver(self,selector:#selector(greenLable),name:Notification.Name.greenLable, object: nil)
            }

            @objc func redLable() {
                word.backgroundColor = .red
            }
            @objc func greenLable() {
                word.backgroundColor = .green
            }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
    }
    
    private func setupLayer() {
        view.addSubview(stackView)
        view.addSubview(word)
        view.addSubview(wordCheck!)
        
        NSLayoutConstraint.activate([
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        stackView.heightAnchor.constraint(equalToConstant: 150),
        stackView.widthAnchor.constraint(equalToConstant: 300)
        ])
        NSLayoutConstraint.activate([
        word.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        word.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        word.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 15),
        word.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
        wordCheck!.topAnchor.constraint(equalTo: word.bottomAnchor, constant: 30),
        wordCheck!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
        wordCheck!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        wordCheck!.heightAnchor.constraint(equalToConstant: 50)
                ])
        stackView.addArrangedSubview(buttonOne!)
        stackView.addArrangedSubview(buttonTwo!)
    }

}

extension FeedViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        if self .word.text != ""{
            self.modelCheck.check(inputWord: self.word.text!)
        } else {
            self.word.placeholder = "Введите слово"
        }
        return true
    }
}

public extension NSNotification.Name {
    static let redLable = NSNotification.Name("redLable")
    static let greenLable = NSNotification.Name("greenLable")
}

protocol FeedViewOutput {
    var coordinator: FeedCoordinator? { get set }

    func showPost()
}
