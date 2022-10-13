
//  ProfileViewController.swift
//  Navigation
//
//  Created by MacBook Air on 21.09.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    
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

    @objc func changeTitle() {
        profileHeaderView.nameLabel.text = "New title"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        profileHeaderView.backgroundColor = .systemGray
        view.addSubview(profileHeaderView)
        view.addSubview(changeTitleButton)
        let safe = view.safeAreaLayoutGuide
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
       NSLayoutConstraint.activate([
        profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        profileHeaderView.topAnchor.constraint(equalTo: safe.topAnchor),
        profileHeaderView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 220),
        
        changeTitleButton.heightAnchor.constraint(equalToConstant: 50),
        changeTitleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        changeTitleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        changeTitleButton.bottomAnchor.constraint(equalTo: safe.bottomAnchor)
       ])
    }
}
