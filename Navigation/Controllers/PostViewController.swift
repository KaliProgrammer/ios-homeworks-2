//
//  PostViewController.swift
//  Navigation
//
//  Created by MacBook Air on 22.09.2022.
//

import UIKit

class PostViewController: UIViewController {
    var titlePost: String = "Anonymus"
    var post = Post(title: "+")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        self.navigationItem.title = "Post"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonAction))
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc private func buttonAction() {
        let infoViewController = InfoViewController()
        self.present(infoViewController, animated: true, completion: nil)
        infoViewController.view.backgroundColor = .systemYellow
    }
}



