//
//  LoginViewController.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 23.03.2022.
//

import UIKit
import Foundation




class LogInViewController: UIViewController {
    
    var delegate: LoginViewControllerDelegate?
    var coordinator: ProfileCoordinator?
 
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)    // подписаться на уведомления
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let users = delegate?.checkUsers()
                if users != nil && !users!.isEmpty {
                    coordinator?.loginButtonPressed()
                }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)    // отписаться от уведомлений
        let nc = NotificationCenter.default
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
       

    override func viewWillDisappear(_ animated: Bool) {
                    super.viewWillDisappear(animated)
        }
    
    
    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }
    @objc private func kbdHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    private let mailText = MailTextField()
    private let passText = PasswordTextField()
    
    var count = 0
   private let timerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private lazy var pickUpPassword: UIButton = {
        let button = UIButton()
        button.backgroundColor = .buttonColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Подобрать пароль", for: .normal)
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(pickUpPass), for: .touchUpInside)
        return button
        
    }()
    
    private lazy var biometricAuthButton: UIButton = {
           let button = UIButton(type: .system)
           button.backgroundColor = .lightGray
           button.setTitle("Biometric \nAuth", for: .normal)
           button.titleLabel?.lineBreakMode = .byWordWrapping
           button.titleLabel?.textAlignment = .center
           button.setTitleColor(.white, for: .normal)
           button.layer.cornerRadius = 10
           button.layer.masksToBounds = false
           button.clipsToBounds = true
           button.addTarget(self, action: #selector(biometricAuthButtonPressed), for: .touchUpInside)
           button.translatesAutoresizingMaskIntoConstraints = false
           return button
       }()
    
    
    private var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .backgroundColor
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let contentView: UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    private let logoImage: UIImageView = {
        let image =  UIImageView()
        image.image = UIImage(named: "logo")
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private lazy  var logInbatt = CustomButton(title: "Log In", color: .buttonColor, colorTitle: .black, borderWidth: 1, cornerRadius: 16)
    {
        
        self.loginButtonPressed()
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        setConsteraint()
        startTimer()
        
    }
    
    private func startTimer() {
            let timer = Timer(timeInterval: 1, repeats: true) { (_) in
                self.timerLabel.text = "Вы находитесь на этом экране \(self.count) секунд(ы)"
                self.count += 1
                if self.count > 30 {
                    self.timerLabel.textColor = .red
                }
            }
            RunLoop.main.add(timer, forMode: .common)
        }
    @objc func biometricAuthButtonPressed() {
            print("Нажали кнопку биометрической авторизации")
            LocalAuthorizationService().authorizeIfPossible { [self] result in
                if result {
                    print("Биометрическая авторизация успешна")
                    coordinator?.loginButtonPressed()
                } else {
                    print("Биометрическая авторизация не успешна")
                    
                }
            }
        }
    
    @objc func pickUpPass() {
        self.spinner.startAnimating()
            let operationQueue = OperationQueue()
            operationQueue.qualityOfService = .background
            let operation = BruteForceOperation(passField: passText, spinner: spinner)
            operationQueue.addOperation(operation)
        }
    @objc private func loginButtonPressed() {
        if delegate!.creteUser(id: UUID().uuidString, email: mailText.text, pass: passText.text, failure: coordinator!.showAlert) {
                    coordinator?.loginButtonPressed()
                }
          
        }
    private func setConsteraint(){
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        scrollView.addSubview(contentView)
        scrollView.addSubview(pickUpPassword)
        scrollView.addSubview(biometricAuthButton)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        contentView.addSubview(logoImage)
        contentView.addSubview(logInbatt!)
        contentView.addSubview(mailText)
        contentView.addSubview(passText)
        contentView.addSubview(timerLabel)
        contentView.addSubview(spinner)
        
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImage.centerYAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.heightAnchor.constraint(equalToConstant: 100 )
        ])
        
        NSLayoutConstraint.activate([
            timerLabel.topAnchor.constraint(equalTo: logInbatt!.bottomAnchor, constant: 100),
            timerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            timerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            timerLabel.heightAnchor.constraint(equalToConstant: 40 )
        ])
        
        NSLayoutConstraint.activate([
            spinner.centerYAnchor.constraint(equalTo: logInbatt!.bottomAnchor, constant: 20),
            spinner.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
        ])
        
        NSLayoutConstraint.activate([
            logInbatt!.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logInbatt!.topAnchor.constraint(equalTo: passText.bottomAnchor, constant: 16),
            logInbatt!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInbatt!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInbatt!.heightAnchor.constraint(equalToConstant: 50 ),
            logInbatt!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            pickUpPassword.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pickUpPassword.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 16),
            pickUpPassword.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            pickUpPassword.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            pickUpPassword.heightAnchor.constraint(equalToConstant: 50 )
            
        ])
        
        NSLayoutConstraint.activate([
            mailText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            mailText.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            mailText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mailText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            mailText.heightAnchor.constraint(equalToConstant: 40 )
        ])
        NSLayoutConstraint.activate([
            passText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            passText.topAnchor.constraint(equalTo: mailText.bottomAnchor, constant: 0),
            passText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            passText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            passText.heightAnchor.constraint(equalToConstant: 40 )
        ])
        
        NSLayoutConstraint.activate([
            biometricAuthButton.heightAnchor.constraint(equalToConstant: 50),
            biometricAuthButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            biometricAuthButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            biometricAuthButton.topAnchor.constraint(equalTo: logInbatt!.bottomAnchor, constant: 50)
        ])
        
    }
}

protocol LoginViewControllerDelegate {
    func creteUser(id: String, email: String?, pass: String?, failure: @escaping (Errors) -> Void) -> Bool
    func checkUsers() -> [User]
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

