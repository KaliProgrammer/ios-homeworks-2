
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
        profileHeaderView.backgroundColor = .systemGray
        view.addSubview(profileHeaderView)
        let safe = view.safeAreaLayoutGuide
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
       NSLayoutConstraint.activate([
        profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        profileHeaderView.topAnchor.constraint(equalTo: safe.topAnchor),
        profileHeaderView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 220)
       ])
    }
}
