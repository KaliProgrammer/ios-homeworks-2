
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
        view.addSubview(profileHeaderView)
        profileHeaderView.setupStatusButton()
        profileHeaderView.setupNameLabel()
        profileHeaderView.setupStatusLabel()
        profileHeaderView.setupImageView()
        profileHeaderView.setupText()
        profileHeaderView.setupTitleButton()
        profileHeaderView.backgroundColor = .systemGray
        setupProfileConstraints()
    }
    
    private func setupProfileConstraints() {
         let safe = self.view.safeAreaLayoutGuide
         profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
         profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
         profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
         profileHeaderView.topAnchor.constraint(equalTo: safe.topAnchor),
         profileHeaderView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 220)
        ])
     }
}
