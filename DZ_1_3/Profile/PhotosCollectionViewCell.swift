//
//  PhotosCollectionViewCell.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 09.04.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = .green
        setupLayouts()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill

            return imageView
        }()
    
    private func setupLayouts() {
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
        ])
    }
    
    
}
