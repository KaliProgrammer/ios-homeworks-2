//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by MacBook Air on 19.10.2022.
//

import Foundation
import UIKit

struct CustomData{
    var image: String
}

let photosData = [
CustomData(image: "photo1"),
CustomData(image: "photo2"),
CustomData(image: "photo3"),
CustomData(image: "photo4"),
]

class PhotosTableViewCell: UICollectionViewCell {
    
     lazy var image: UIImageView = {
        let myImage = UIImageView()
        myImage.translatesAutoresizingMaskIntoConstraints = false
        myImage.contentMode = .scaleAspectFill
        myImage.clipsToBounds = true
        myImage.layer.masksToBounds = true
        myImage.layer.cornerRadius = 6
        return myImage
    }()

    override init(frame: CGRect) {
        super .init(frame: frame)
        contentView.addSubview(image)
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func apply(photos: UIImage) {
        self.image.image = photos
    }
    
}
