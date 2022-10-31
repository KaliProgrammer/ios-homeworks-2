//
//  FooterView.swift
//  Navigation
//
//  Created by MacBook Air on 16.10.2022.
//

import UIKit

class TableFooter: UITableViewHeaderFooterView {

   static let identifier = "TableFooter"
    
    var buttonTapped: (()->Void)?
    
    private lazy var postLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var likesLabel: UILabel = {
      let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private lazy var viewsLabel: UILabel = {
      let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 2
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func apply(post: String) {
        postLabel.text = post
    }
    func apply(likes: String) {
        likesLabel.text = likes
    }
    func apply(views: String) {
        viewsLabel.text = views
    }

    @objc func didTap() {
        self.buttonTapped?()
    }
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: TableFooter.identifier)
        contentView.addSubview(postLabel)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        tap.numberOfTapsRequired = 1
        self.likesLabel.addGestureRecognizer(tap)
        self.likesLabel.isUserInteractionEnabled = true
    
        NSLayoutConstraint.activate([
            postLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            postLabel.bottomAnchor.constraint(equalTo: likesLabel.topAnchor, constant: -16),
            postLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
           
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            likesLabel.topAnchor.constraint(equalTo: postLabel.bottomAnchor, constant: 16),
            
            viewsLabel.topAnchor.constraint(equalTo: postLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
        
     
        
      
    }
    
 

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
