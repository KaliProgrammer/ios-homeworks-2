//
//  ProfileViewController.swift
//  Navigation
//
//  Created by MacBook Air on 21.09.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupImage()
        setupButton()
        setupNameLabel()
        setupStatusLabel()
        setupTextField()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.bounds
    }
    
    private lazy var profileImageView: UIImageView = {
        let picture = UIImageView()
        picture.image = UIImage(named: "woman")
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.layer.borderColor = UIColor.white.cgColor
        picture.layer.borderWidth = 3
        picture.layer.cornerRadius = 120/2
        picture.clipsToBounds = true
        return picture
    }()
    
    func setupImage() {
        self.view.addSubview(self.profileImageView)
        self.profileImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        self.profileImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        self.profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        self.profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -116).isActive = true
    }
    
    private lazy var nameLabel: UILabel = {
        let userName = UILabel()
        userName.textColor = UIColor.black
        userName.text = "Jane Phillips"
        userName.font = .boldSystemFont(ofSize: 18)
        userName.translatesAutoresizingMaskIntoConstraints = false
        return userName
    }()
    
    func setupNameLabel() {
        self.view.addSubview(nameLabel)
        self.nameLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor, constant: 110).isActive = true
        self.nameLabel.widthAnchor.constraint(equalTo: button.widthAnchor).isActive = true
        self.nameLabel.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    private lazy var statusLabel: UILabel = {
        let status = UILabel()
        status.textColor = UIColor.darkGray
        status.text = "😊"
        status.font = UIFont.systemFont(ofSize: 18)
        status.textAlignment = .center
        status.translatesAutoresizingMaskIntoConstraints = false
        status.numberOfLines = 0
        
        
        return status
    }()
    
    func setupStatusLabel() {
        view.addSubview(statusLabel)
        self.statusLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor, constant: -20).isActive = true
        self.statusLabel.widthAnchor.constraint(equalTo: button.widthAnchor).isActive = true
        self.statusLabel.heightAnchor.constraint(equalToConstant: 340).isActive = true
            
    }

    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowRadius = 4.0
        button.layer.shadowOpacity = 0.7
        button.setTitleColor(.black, for: .highlighted)
        button.layer.masksToBounds = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showStatus), for: .touchUpInside)
        return button
    }()
    
    private func setupButton() {
        self.view.addSubview(self.button)
        self.button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.button.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 270).isActive = true
        self.button.widthAnchor.constraint(equalToConstant: 300).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    let textField: UITextField = {
        let text = UITextField()
        text.backgroundColor = UIColor.white
        text.font = UIFont.systemFont(ofSize: 15)
        text.layer.cornerRadius = 12
        text.translatesAutoresizingMaskIntoConstraints = false
        text.borderStyle = UITextField.BorderStyle.roundedRect
        text.clipsToBounds = true
        text.layer.borderWidth = 1
        text.keyboardType = .default
        text.clearButtonMode = .whileEditing
        text.placeholder = "Enter your status here..."
        text.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return text
    }()
    
    @objc func showStatus() {
        statusLabel.text = textField.text
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
    }
    
    private func setupTextField() {
        self.view.addSubview(textField)
        self.textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.textField.centerXAnchor.constraint(equalTo: button.centerXAnchor, constant: 56).isActive = true
        self.textField.topAnchor.constraint(equalTo: button.topAnchor, constant: -52).isActive = true
        self.textField.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 17).isActive = true
    }
    
}
