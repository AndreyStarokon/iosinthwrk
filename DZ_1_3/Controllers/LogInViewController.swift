//
//  LoginViewController.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 23.03.2022.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import Firebase



class LogInViewController: UIViewController {
    
    var delegate: LoginViewControllerDelegate?
    var coordinator: ProfileCoordinator?
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)    // подписаться на уведомления
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
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
        button.backgroundColor = .cyan
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Подобрать пароль", for: .normal)
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(pickUpPass), for: .touchUpInside)
        return button
        
    }()
    
    
    private var scrollView: UIScrollView = {
        let scroll = UIScrollView()
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
    private lazy  var logInbatt = CustomButton(title: "Log In", color: UIColor("#4885CC"), colorTitle: .black, borderWidth: 1, cornerRadius: 16)
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
    
    
    @objc func pickUpPass() {
        self.spinner.startAnimating()
            let operationQueue = OperationQueue()
            operationQueue.qualityOfService = .background
            let operation = BruteForceOperation(passField: passText, spinner: spinner)
            operationQueue.addOperation(operation)
        }
    @objc private func loginButtonPressed() {
           
           delegate?.signIn(email: mailText.text!, pass: passText.text!, failure: coordinator!.showAlert)
            
           handle = Auth.auth().addStateDidChangeListener { (auth, user) in
        //   print("USERS EMAIL: \(user?.email ?? "введите e-mail")")
        
                                    if user != nil {
                                        self.coordinator?.loginButtonPressed()
                                    }
                                }
       Auth.auth().removeStateDidChangeListener(handle!)
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
    }


}

protocol LoginViewControllerDelegate {
    func checkLogin(userLogin: String) -> Bool
    func checkPass(userPass: String) -> Bool
    func signIn(email: String, pass: String, failure: @escaping (Errors) -> Void)
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

