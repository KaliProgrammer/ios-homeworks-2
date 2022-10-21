//
//  File.swift
//  Navigation
//
//  Created by MacBook Air on 20.10.2022.
//

import Foundation
import UIKit

class CollectionHeader: UICollectionReusableView {
    static let identifier = "header"
    
    lazy var photosLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private lazy var arrowImage: UIImageView = {
       let image = UIImageView(image: UIImage(systemName: "arrow.right"))
        image.tintColor = .black
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(photosLabel)
        addSubview(arrowImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photosLabel.frame = CGRect(x: 12, y: 12, width: self.frame.width, height: 18)
        arrowImage.frame = CGRect(x: 358, y: 12, width: 20, height: 18)
    }
    
}
