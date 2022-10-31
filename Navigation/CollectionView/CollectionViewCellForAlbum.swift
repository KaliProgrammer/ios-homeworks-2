//
//  CollectionViewCellForAlbum.swift
//  Navigation
//
//  Created by MacBook Air on 20.10.2022.
//

import UIKit

class CollectionViewCellForAlbum: UICollectionViewCell {
    static let identifier = "CollectionViewCellForAlbum"
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func apply(photosForAlbum: UIImage) {
        self.imageView.image = photosForAlbum
    }
    
}

