
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
        container.backgroundColor = .white
        return container
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
        
        let safeArea = containerView.safeAreaLayoutGuide

       NSLayoutConstraint.activate([
        profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        profileHeaderView.topAnchor.constraint(equalTo: safeArea.topAnchor),
        profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
        
        tableView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 220),
        tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
        tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
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

