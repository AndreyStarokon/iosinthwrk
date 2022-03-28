//
//  LoginViewController.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 23.03.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
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
    
    private let logInButton: UIButton = {
         let button = UIButton()
         let backGroundColor = UIColor("#4885CC")
         button.backgroundColor = backGroundColor
         button.layer.cornerRadius = 16
         button.setTitle("Log In", for: .normal)
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
     }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        setConsteraint()
        logInButton.addTarget(self, action: #selector(logIn), for: .touchUpInside)
    }
    
    @objc func logIn () {
        let profile = ProfileViewController()
        present(profile, animated: true)
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
        
        NSLayoutConstraint.activate([
          contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
          contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
          contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
          contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
          contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
   
          contentView.addSubview(logoImage)
          contentView.addSubview(logInButton)
          contentView.addSubview(mailText)
          contentView.addSubview(passText)
       
          NSLayoutConstraint.activate([
           logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
           logoImage.centerYAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
           logoImage.widthAnchor.constraint(equalToConstant: 100),
           logoImage.heightAnchor.constraint(equalToConstant: 100 )
        ])
         NSLayoutConstraint.activate([
           logInButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
           logInButton.topAnchor.constraint(equalTo: passText.bottomAnchor, constant: 16),
           logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
           logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
           logInButton.heightAnchor.constraint(equalToConstant: 50 ),
           logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
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

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

