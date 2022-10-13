//
//  LogInViewController.swift
//  Navigation
//
//  Created by MacBook Air on 11.10.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 200)
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.backgroundColor = .white
        view.frame = self.view.bounds
        view.contentSize = contentViewSize
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.frame.size = contentViewSize
        return view
    }()
    
    lazy var logo: UIImageView = {
        let logoVK = UIImageView()
        logoVK.image = UIImage(named: "logo")
        logoVK.translatesAutoresizingMaskIntoConstraints = false
        return logoVK
    }()
    

    lazy var viewForLogin: UIView = {
       let loginView = UIView()
        loginView.layer.borderColor = UIColor.lightGray.cgColor
        loginView.layer.borderWidth = 0.5
        loginView.layer.cornerRadius = 10
        loginView.clipsToBounds = true
        loginView.translatesAutoresizingMaskIntoConstraints = false
        return loginView
    }()

     lazy var emailTextField: TextFieldWidthPadding = {
        let text = TextFieldWidthPadding()
        text.textAlignment = .left
        text.backgroundColor = .systemGray6
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .black
        text.font = .systemFont(ofSize: 16)
        text.layer.borderWidth = 0.5
        text.placeholder = "Email or phone"
        text.layer.borderColor = UIColor.lightGray.cgColor
        text.autocapitalizationType = .none
        text.delegate = self
        return text
    }()
    
    lazy var passwordTextField: TextFieldWidthPadding = {
       let text = TextFieldWidthPadding()
       text.textAlignment = .left
       text.backgroundColor = .systemGray6
       text.translatesAutoresizingMaskIntoConstraints = false
       text.textColor = .black
       text.font = .systemFont(ofSize: 16)
       text.layer.borderWidth = 0.5
       text.placeholder = "Password"
       text.layer.borderColor = UIColor.lightGray.cgColor
       text.autocapitalizationType = .none
       text.isSecureTextEntry = true
       text.delegate = self

       return text
   }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log in", for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.setTitleColor( .white, for: .normal)
        button.setTitleColor(.init(white: 0, alpha: 0.8), for: .highlighted)
        button.setTitleColor(.init(white: 0, alpha: 0.8), for: .disabled)
        button.setTitleColor(.init(white: 0, alpha: 0.8), for: .selected)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addAction(UIAction(handler: { _ in
            let vc = ProfileViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(logo)
        containerView.addSubview(viewForLogin)
        viewForLogin.addSubview(emailTextField)
        viewForLogin.addSubview(passwordTextField)
        containerView.addSubview(loginButton)
        view.backgroundColor = .white

      NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalToConstant: 100),
            logo.heightAnchor.constraint(equalToConstant: 100),
            logo.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            logo.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 70),
            
            emailTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),

            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 0),
            passwordTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            viewForLogin.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120),
            viewForLogin.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            viewForLogin.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            viewForLogin.heightAnchor.constraint(equalToConstant: 100),
            viewForLogin.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),

            loginButton.topAnchor.constraint(equalTo: viewForLogin.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
     ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.all)
    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
