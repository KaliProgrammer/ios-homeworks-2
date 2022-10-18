//
//  CustomTableViewCell.swift
//  Navigation
//
//  Created by MacBook Air on 16.10.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

static let identifier = "CustomTableViewCell"
    
     lazy var postImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        contentView.addSubview(postImage)
        contentView.contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            postImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            postImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func apply(customImage: UIImage) {
        postImage.image = customImage
    }
}



