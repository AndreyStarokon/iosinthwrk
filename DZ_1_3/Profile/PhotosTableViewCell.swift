//
//  PhotosTableViewCell.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 05.04.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    let photoCell = PhotoViewCell()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        custmizeCell()
        photoCell.translatesAutoresizingMaskIntoConstraints = false

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func custmizeCell() {
        contentView.addSubview(photoCell)
        photoCell.backgroundColor = .white
        NSLayoutConstraint.activate([
            photoCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
              
             ])
       
    }
    
    
}

