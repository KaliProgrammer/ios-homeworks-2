//
//  ImageViewController.swift
//  Navigation
//
//  Created by MacBook Air on 29.10.2022.
//

import UIKit

class ImageViewController: UIViewController {

    var selectedIndex: Int = 0
    var imageArray: [CustomDataForAlbum] = []

    private lazy var myImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        let myImage = UIImage(named: "xmark")
        button.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(UIAction(handler: { _ in
            let transition = CATransition()
            transition.duration = 0.3
            transition.type = .reveal
            transition.subtype = .fromLeft
            self.view.window?.layer.add(transition, forKey: kCATransition)
            self.navigationController?.popViewController(animated: true)
        }), for: .touchUpInside)
        return button
    }()
    
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupGesture()
        loadImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func loadImage() {
        myImage.image = UIImage(named: photosDataForAlbum[selectedIndex].image)
        countLabel.text = String(format: "%ld / %ld", selectedIndex + 1, photosDataForAlbum.count)
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(myImage)
        view.addSubview(countLabel)
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            countLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            countLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 175),
            countLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -160),
                        
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7),
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 23),
            closeButton.heightAnchor.constraint(equalToConstant: 28),
                        
            myImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            myImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
        ])
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        NSLayoutConstraint.activate([
            myImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            myImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7),
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
                    
            countLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            countLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 175),
            countLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -160),
        ])
    }
    
    func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSingleTap))
        tapGesture.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleSingleTap() {
        if closeButton.isHidden {
            closeButton.isHidden = false
            countLabel.isHidden = false
        } else {
            closeButton.isHidden = true
            countLabel.isHidden = true
        }
    }
}

extension UIViewController {
    
    func pushView(viewController: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .fade
        self.view.window?.layer.add(transition, forKey: kCATransition)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
