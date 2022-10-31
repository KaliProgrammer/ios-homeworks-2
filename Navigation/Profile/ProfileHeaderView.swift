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
        userName.text = "My Profile"
        userName.font = .boldSystemFont(ofSize: 18)
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.textAlignment = .center
        return userName
    }()
    
    lazy var statusLabel: UILabel = {
        let status = UILabel()
        status.textColor = UIColor.darkGray
        status.text = "My status..."
        status.font = UIFont.systemFont(ofSize: 14)
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
        
    lazy var textField: UITextField = {
        let text = UITextField()
        text.backgroundColor = .white
        text.font = UIFont.systemFont(ofSize: 15)
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
        self.addSubview(profileImageView)
        self.addSubview(nameLabel)
        self.addSubview(statusLabel)
        self.addSubview(showStatusButton)
        self.addSubview(textField)
        let safe = self.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
                   profileImageView.widthAnchor.constraint(equalToConstant: 120),
                   profileImageView.heightAnchor.constraint(equalToConstant: 120),
                   profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
                   profileImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -116),
                   
                   nameLabel.centerXAnchor.constraint(equalTo: showStatusButton.centerXAnchor),
                   nameLabel.widthAnchor.constraint(equalTo: showStatusButton.widthAnchor),
                   nameLabel.heightAnchor.constraint(equalToConstant: 50),
                   nameLabel.topAnchor.constraint(equalTo: safe.topAnchor, constant: 27),
                   
                   showStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                   showStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
                   showStatusButton.heightAnchor.constraint(equalToConstant: 50),
                   
                   statusLabel.heightAnchor.constraint(equalToConstant: 110),
                   statusLabel.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: 40),
                   statusLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
                   statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: -45),
                   
                   textField.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -16),
                   textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
                   textField.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 17),
               ])
        
        let backgroundTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapBackground))
        self.addGestureRecognizer(backgroundTapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapBackground() {
        self.endEditing(true)
    }
    
    @objc func showStatus() {
        guard textField.text != "" else {
            textField.shake()
            return
        }
        statusLabel.text = textField.text
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
       
    }
}
    
    

