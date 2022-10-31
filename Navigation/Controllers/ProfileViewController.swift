
//  ProfileViewController.swift
//  Navigation
//
//  Created by MacBook Air on 21.09.2022.
//

import UIKit

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {
    
    private lazy var tapGestureRecogniser: UITapGestureRecognizer = {
        let gesture = UITapGestureRecognizer()
        gesture.numberOfTapsRequired = 1
        gesture.addTarget(self, action: #selector(didTapGesture))
        return gesture
    }()
    
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
    
    private lazy var newView: UIView = {
        let newView = UIView()
        newView.translatesAutoresizingMaskIntoConstraints = false
        return newView
    }()
    
    private lazy var dismissButton: UIButton = {
         let button = UIButton()
         button.translatesAutoresizingMaskIntoConstraints = false
         button.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
         button.tintColor = .black
        button.addTarget(self, action: #selector(closeAvatar), for: .touchUpInside)
         return button
     }()
    
    @objc private func closeAvatar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .curveEaseInOut) {
            self.dismissButton.alpha = 0
        } completion: { _ in
            self.newView.alpha = 0
            self.profileImageView.layer.borderWidth = 3
            self.profileImageView.layer.bounds = CGRect(x: 0, y: 0, width: 120, height: 120)
            self.profileImageView.layer.cornerRadius = self.profileImageView.bounds.width/2
            self.profileImageView.layoutIfNeeded()
        }
    }
    
    @objc func didTapGesture() {
        UIView.animate(withDuration: 0.3, delay: 0.5) {
            self.newView.addSubview(self.dismissButton)
            self.view.layoutIfNeeded()

            NSLayoutConstraint.activate([
                self.dismissButton.leadingAnchor.constraint(equalTo: self.newView.leadingAnchor, constant: 373),
                self.dismissButton.topAnchor.constraint(equalTo: self.newView.topAnchor),
                self.dismissButton.trailingAnchor.constraint(equalTo: self.newView.trailingAnchor),
            ])
        }
        
        UIView.animate(withDuration: 0.5, delay: 0) {

            self.newView.backgroundColor = UIColor(white: 1, alpha: 0.5)
            self.profileImageView.alpha = 1
            self.newView.addSubview(self.profileImageView)

            NSLayoutConstraint.activate([
                self.newView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
                self.newView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor),
                self.newView.topAnchor.constraint(equalTo: self.containerView.topAnchor),
                self.newView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor),

                self.profileImageView.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor),
                self.profileImageView.widthAnchor.constraint(equalToConstant: 420),
                self.profileImageView.heightAnchor.constraint(equalToConstant: 400),
                self.profileImageView.topAnchor.constraint(equalTo: self.containerView.topAnchor,constant: 100),
            ])
            self.profileImageView.layer.cornerRadius = 0
            self.view.layoutIfNeeded()
        }
    }
          
    let profileHeaderView = ProfileHeaderView()
        
    private lazy var containerView: UIView = {
        let container = UIView()
        container.frame.size = contentSize
        container.backgroundColor = .lightGray
        return container
    }()
    
    private lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 29, left: 12, bottom: 12, right: 12)
        layout.headerReferenceSize = CGSize(width: self.view.frame.width, height: 12)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        
        cv.register(PhotosTableViewCell.self, forCellWithReuseIdentifier: "cell")
        cv.register(CollectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionHeader.identifier)
        return cv
    }()
    
    private lazy var scrollView: UIScrollView = {
           let scrollView = UIScrollView(frame: .zero)
           scrollView.backgroundColor = .white
           scrollView.contentSize = contentSize
           scrollView.frame = view.bounds
           scrollView.autoresizingMask = .flexibleHeight
           scrollView.bounces = true
           scrollView.showsVerticalScrollIndicator = false
           return scrollView
       }()
    
    private lazy var contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 2000)
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 300
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.register(TableHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        tableView.register(TableFooter.self, forHeaderFooterViewReuseIdentifier: "footer")
        tableView.sectionHeaderTopPadding = 0
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileHeaderView.backgroundColor = .lightGray
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        scrollView.addSubview(newView)
        containerView.addSubview(profileHeaderView)
        containerView.addSubview(collectionView)
        containerView.addSubview(tableView)

        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        
        profileHeaderView.profileImageView.addGestureRecognizer(tapGestureRecogniser)
        profileHeaderView.profileImageView.isUserInteractionEnabled = true
        
        let safeArea = containerView.safeAreaLayoutGuide

       NSLayoutConstraint.activate([
        profileHeaderView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
        profileHeaderView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
        profileHeaderView.topAnchor.constraint(equalTo: safeArea.topAnchor),
        profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
        
        tableView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 360),
        tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
        tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        
        collectionView.topAnchor.constraint(equalTo: profileHeaderView.bottomAnchor, constant: 1),
        collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
        collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        collectionView.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -12),
       ])
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return post.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as! CustomTableViewCell
        
        if let customImage = UIImage(named: post[indexPath.section].image) {
            cell.apply(customImage: customImage)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? TableHeader
        header?.apply(text: post[section].author)
           return header
       }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
          let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: "footer") as? TableFooter
        footer?.apply(post: post[section].description)
        footer?.apply(likes: String("Likes: \(post[section].likes + 1)"))
          
        footer?.buttonTapped = {
            footer?.apply(likes: String("Likes: \(post[section].likes += 1)"))
            self.tableView.reloadData()
        }

        footer?.apply(views: String("Views: \(post[section].views)"))
          return footer
      }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) is CustomTableViewCell else { return }
        if let customImage = UIImage(named: post[indexPath.section].image) {
            self.imageTapped(image: customImage, author: post[indexPath.section].author, post: post[indexPath.section].description, numberOfLikes: post[indexPath.section].likes, numberOfViews: post[indexPath.section].views)
            post[indexPath.section].views += 1
            tableView.reloadData()
       }
    }
    
    func imageTapped(image: UIImage, author: String, post: String, numberOfLikes: Int, numberOfViews: Int) {
        let myImage = UIImageView()
        myImage.image = image
        myImage.backgroundColor = .white
        myImage.contentMode = .scaleAspectFit
        myImage.isUserInteractionEnabled = true
        myImage.translatesAutoresizingMaskIntoConstraints = false
        myImage.backgroundColor = .black
        
        let authorLabel = UILabel(frame: .zero)
        authorLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        authorLabel.textAlignment = .left
        authorLabel.textColor = .black
        authorLabel.text = author
        authorLabel.numberOfLines = 0
        authorLabel.translatesAutoresizingMaskIntoConstraints = false

        let postText = UILabel(frame: .zero)
        postText.font = UIFont.systemFont(ofSize: 14)
        postText.textColor = .systemGray
        postText.textAlignment = .left
        postText.numberOfLines = 0
        postText.text = post
        postText.lineBreakMode = .byWordWrapping
        postText.isUserInteractionEnabled = true
        postText.translatesAutoresizingMaskIntoConstraints = false
    
        let likesLabel = UILabel(frame: .zero)
        likesLabel.font = UIFont.systemFont(ofSize: 16)
        likesLabel.textColor = .black
        likesLabel.numberOfLines = 2
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.text = "Likes: \(numberOfLikes)"
        likesLabel.isUserInteractionEnabled = true

        let viewsLabel = UILabel(frame: .zero)
        viewsLabel.font = UIFont.systemFont(ofSize: 16)
        viewsLabel.textColor = .black
        viewsLabel.numberOfLines = 2
        viewsLabel.isUserInteractionEnabled = true
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        viewsLabel.text = "Views: \(numberOfViews)"
        
        let postView = UIView()
        postView.frame = UIScreen.main.bounds
        postView.backgroundColor = .white
        self.view.addSubview(postView)
        postView.addSubview(myImage)
        postView.addSubview(authorLabel)
        postView.addSubview(postText)
        postView.addSubview(likesLabel)
        postView.addSubview(viewsLabel)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreen))
        postView.addGestureRecognizer(tapGesture)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
        
        
        NSLayoutConstraint.activate([
            
            authorLabel.topAnchor.constraint(equalTo: postView.topAnchor, constant: 180),
            authorLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -200),
            authorLabel.bottomAnchor.constraint(equalTo: myImage.topAnchor, constant: -16),

            myImage.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            myImage.leadingAnchor.constraint(equalTo: postView.leadingAnchor),
            myImage.trailingAnchor.constraint(equalTo: postView.trailingAnchor),
            myImage.heightAnchor.constraint(equalToConstant: 300),
            myImage.bottomAnchor.constraint(equalTo: postText.topAnchor, constant: -16),
            
            postText.topAnchor.constraint(equalTo: myImage.bottomAnchor, constant: 16),
            postText.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 16),
            postText.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -16),
            postText.bottomAnchor.constraint(equalTo: likesLabel.topAnchor, constant: -16),

            likesLabel.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 16),

            viewsLabel.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -16),
        ])
        
    }
    
    @objc func dismissFullscreen(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
        sender.view?.removeFromSuperview()
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(collectionView.frame.width)/4.6, height:   (collectionView.frame.width)/5.6)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotosTableViewCell
        
        if let customImage = UIImage(named: photosData[indexPath.row].image) {
            cell.apply(photos: customImage)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionHeader.identifier, for: indexPath) as! CollectionHeader
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let viewController = PhotosViewController()
        viewController.title = "Photo Gallery"
            self.navigationController?.pushViewController(viewController, animated: true)
    }
}

