//
//  CollectionViewCellForAlbum.swift
//  Navigation
//
//  Created by MacBook Air on 20.10.2022.
//

import UIKit

struct CustomDataForAlbum{
    var image: String
}

let photosDataForAlbum = [
CustomDataForAlbum(image: "ph5"),
CustomDataForAlbum(image: "ph6"),
CustomDataForAlbum(image: "ph7"),
CustomDataForAlbum(image: "ph8"),
CustomDataForAlbum(image: "ph9"),
CustomDataForAlbum(image: "ph10"),
CustomDataForAlbum(image: "ph11"),
CustomDataForAlbum(image: "ph12"),
CustomDataForAlbum(image: "ph13"),
CustomDataForAlbum(image: "ph14"),
CustomDataForAlbum(image: "ph15"),
CustomDataForAlbum(image: "ph16"),
CustomDataForAlbum(image: "ph17"),
CustomDataForAlbum(image: "ph18"),
CustomDataForAlbum(image: "ph19"),
CustomDataForAlbum(image: "ph20"),
CustomDataForAlbum(image: "ph21"),
CustomDataForAlbum(image: "ph22"),
CustomDataForAlbum(image: "ph23"),
CustomDataForAlbum(image: "ph24"),
]

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
