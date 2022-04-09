//
//  PhotoViewCell.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 05.04.2022.
//

import UIKit

class PhotoViewCell: UIView {
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private let imageOne: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "4")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private let imageTwo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "3")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private let imageThree: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "2")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private let imageFour: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "1")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private let photoLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let arrowButton: UIButton = {
        let arrow = UIButton()
        arrow.setImage(UIImage(named: "\u{2794}")?.withRenderingMode(.alwaysOriginal), for: [])
        arrow.translatesAutoresizingMaskIntoConstraints = false
        return arrow
    }()
    private func setupLayout() {
        
        addSubview(imageOne)
        addSubview(imageTwo)
        addSubview(imageThree)
        addSubview(imageFour)
        addSubview(arrowButton)
        addSubview(photoLabel)
        
        
        NSLayoutConstraint.activate([
            photoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            photoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
        ])
        
        NSLayoutConstraint.activate([
            arrowButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            arrowButton.topAnchor.constraint(equalTo: photoLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageOne.trailingAnchor.constraint(equalTo: imageTwo.leadingAnchor, constant: -8),
            imageOne.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            imageOne.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            imageOne.heightAnchor.constraint(equalToConstant: 70),
            imageOne.widthAnchor.constraint(equalToConstant: 70),
            imageOne.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
        NSLayoutConstraint.activate([
            imageTwo.trailingAnchor.constraint(equalTo: imageThree.leadingAnchor, constant: -8),
            imageTwo.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            imageTwo.heightAnchor.constraint(equalToConstant: 70),
          //  imageTwo.widthAnchor.constraint(equalToConstant: 70),
            imageTwo.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
        NSLayoutConstraint.activate([
            imageThree.trailingAnchor.constraint(equalTo: imageFour.leadingAnchor, constant: -8),
            imageThree.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            imageThree.heightAnchor.constraint(equalToConstant: 70),
           // imageThree.widthAnchor.constraint(equalToConstant: 70),
            imageThree.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
        NSLayoutConstraint.activate([
            imageFour.trailingAnchor.constraint(equalTo: imageTwo.leadingAnchor, constant: -8),
            imageFour.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            imageFour.heightAnchor.constraint(equalToConstant: 70),
          //  imageFour.widthAnchor.constraint(equalToConstant: 70),
            imageFour.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])

    }
}

