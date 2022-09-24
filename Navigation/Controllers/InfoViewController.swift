//
//  InfoViewController.swift
//  Navigation
//
//  Created by MacBook Air on 23.09.2022.
//

import UIKit

class InfoViewController: UIViewController {
    var button = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.frame = CGRect(x: 0, y: 0, width: 150, height: 100)
        button.layer.cornerRadius = 12
        button.center = view.center
        button.backgroundColor = .orange
        button.setTitle("Alert", for: .normal)
        button.addTarget(self, action:#selector(actionButton), for: .touchUpInside)
    }
    @objc func actionButton() {
        showAlert()
    }
}
extension InfoViewController {
    func showAlert() {
        let allertButton = UIAlertController(title: "Welcome", message: "This is a kiddy app", preferredStyle: .alert)
        allertButton.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        allertButton.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        self.present(allertButton, animated: true)
    }
}
