
//  ProfileViewController.swift
//  Navigation
//
//  Created by MacBook Air on 21.09.2022.
//

import UIKit
import SwiftUI



class ProfileViewController: UIViewController {
        
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
        cv.register(PhotosTableViewCell.self, forCellWithReuseIdentifier: "cell")
        cv.register(CollectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionHeader.identifier)
        return cv
    }()
    
    private lazy var scrollView: UIScrollView = {
           let scrollView = UIScrollView(frame: .zero)
           scrollView.backgroundColor = .systemGray
           scrollView.contentSize = contentSize
           scrollView.frame = view.bounds
           scrollView.autoresizingMask = .flexibleHeight
           scrollView.bounces = true
           scrollView.showsVerticalScrollIndicator = false
           return scrollView
       }()
    
    private lazy var contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 1500)
    
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
        containerView.addSubview(profileHeaderView)
        profileHeaderView.addSubview(tableView)
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(collectionView)
        collectionView.backgroundColor = .white
        
        let safeArea = containerView.safeAreaLayoutGuide

       NSLayoutConstraint.activate([
        profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        profileHeaderView.topAnchor.constraint(equalTo: safeArea.topAnchor),
        profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
        
        tableView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 355),
        tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
        tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        
        collectionView.topAnchor.constraint(equalTo: profileHeaderView.bottomAnchor, constant: 1),
        collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
        collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        collectionView.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -12),
       ])
        collectionView.delegate = self
        collectionView.dataSource = self
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
        50
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
          let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: "footer") as? TableFooter
        footer?.apply(post: post[section].description)
        footer?.apply(likes: String("Likes: \(post[section].likes)"))
        footer?.apply(views: String("Views: \(post[section].views)"))

          return footer
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

struct VCPreview: PreviewProvider {
    
    static var previews: some View {
        VCContainerView()
            .previewInterfaceOrientation(.portrait)
    }
    
    struct VCContainerView: UIViewControllerRepresentable {
        
        typealias UIViewControllerType = UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return ProfileViewController()
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    }
}
