//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by MacBook Air on 28.09.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    lazy var profileImageView: UIImageView = {
        let picture = UIImageView()
        picture.image = UIImage(named: "woman")
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.contentMode = .scaleAspectFill
        picture.layer.borderColor = UIColor.white.cgColor
        picture.layer.borderWidth = 3
        picture.layer.cornerRadius = 120/2
        picture.clipsToBounds = true
        picture.layer.masksToBounds = true
        return picture
    }()
    
    lazy var nameLabel: UILabel = {
        let userName = UILabel()
        userName.textColor = UIColor.black
        userName.text = "Jane Phillips"
        userName.font = .boldSystemFont(ofSize: 18)
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.textAlignment = .center
        return userName
    }()
    
    lazy var statusLabel: UILabel = {
        let status = UILabel()
        status.textColor = UIColor.darkGray
        status.text = "😊"
        status.font = UIFont.systemFont(ofSize: 18)
        status.textAlignment = .center
        status.translatesAutoresizingMaskIntoConstraints = false
        status.numberOfLines = 0
        status.contentMode = .scaleToFill
        return status
    }()
    
    lazy var showStatusButton: UIButton = {
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
    
    lazy var changeTitleButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 12
        button.setTitle("Change title", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowRadius = 4.0
        button.layer.shadowOpacity = 0.7
        button.setTitleColor(.black, for: .highlighted)
        button.layer.masksToBounds = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(changeTitle), for: .touchUpInside)
        return button
    }()
    
    lazy var textField: UITextField = {
        let text = UITextField()
        text.backgroundColor = .white
        text.font = UIFont.systemFont(ofSize: 18)
        text.layer.cornerRadius = 12
        text.borderStyle = .roundedRect
        text.layer.borderWidth = 1
        text.clipsToBounds = true
        text.placeholder = "Enter your status here..."
        text.keyboardType = .default
        text.clearButtonMode = .whileEditing
        text.contentHorizontalAlignment = .center
        text.returnKeyType = .done
        text.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStatusButton()
        setupNameLabel()
        setupStatusLabel()
        setupImageView()
        setupText()
        setupTitleButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImageView() {
        self.addSubview(profileImageView)
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalToConstant: 120),
            profileImageView.heightAnchor.constraint(equalToConstant: 120),
            profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            profileImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -116)
        ])
    }
    
    func setupNameLabel() {
        self.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: showStatusButton.centerXAnchor),
            nameLabel.widthAnchor.constraint(equalTo: showStatusButton.widthAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
   }
    
    func setupStatusLabel() {
        self.addSubview(statusLabel)
        NSLayoutConstraint.activate([
            statusLabel.centerXAnchor.constraint(equalTo: showStatusButton.centerXAnchor),
            statusLabel.widthAnchor.constraint(equalToConstant: 150),
            statusLabel.heightAnchor.constraint(equalToConstant: 110)
        ])
    }
    
    func setupStatusButton() {
        self.addSubview(showStatusButton)
        NSLayoutConstraint.activate([
            showStatusButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            showStatusButton.centerYAnchor.constraint(equalTo: self.topAnchor, constant: 180),
            showStatusButton.widthAnchor.constraint(equalToConstant: 300),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupTitleButton() {
        self.addSubview(changeTitleButton)
        NSLayoutConstraint.activate([
            changeTitleButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            changeTitleButton.centerYAnchor.constraint(equalTo: self.topAnchor, constant: 250),
            changeTitleButton.widthAnchor.constraint(equalToConstant: 300),
            changeTitleButton.heightAnchor.constraint(equalToConstant: 50)
        ])
   }
    
    func setupText() {
        self.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.topAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -80),
            textField.centerXAnchor.constraint(equalTo: showStatusButton.centerXAnchor, constant: 56),
            textField.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 17)
        ])
    }
    
    @objc func showStatus() {
        statusLabel.text = textField.text
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
       
    }
    
    @objc func changeTitle() {
        nameLabel.text = "New title"
    }
}
    
    

