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
        arrowButton.addTarget(self, action: #selector(goToCollection), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private let imageOne: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image1")
        image.clipsToBounds = true
        image.layer.cornerRadius = 6
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private let imageTwo: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.image = UIImage(named: "image2")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private let imageThree: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.image = UIImage(named: "image3")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private let imageFour: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.image = UIImage(named: "image4")
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
        arrow.setTitleColor(.black, for: .normal)
        arrow.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        arrow.setTitle("→", for: .normal)
        arrow.translatesAutoresizingMaskIntoConstraints = false
        return arrow
    }()
    @objc private func  goToCollection () {
        
    }
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
            arrowButton.centerYAnchor.constraint(equalTo: photoLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
         //   imageOne.trailingAnchor.constraint(equalTo: imageTwo.leadingAnchor, constant: -8),
            imageOne.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            imageOne.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            imageOne.heightAnchor.constraint(equalToConstant: 70),
            imageOne.widthAnchor.constraint(equalToConstant: 85),
            imageOne.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
        NSLayoutConstraint.activate([
            imageTwo.leadingAnchor.constraint(equalTo: imageOne.trailingAnchor, constant: 8),
          //  imageTwo.trailingAnchor.constraint(equalTo: imageThree.leadingAnchor, constant: 8),
            imageTwo.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            imageTwo.heightAnchor.constraint(equalToConstant: 70),
            imageTwo.widthAnchor.constraint(equalToConstant: 85),
            imageTwo.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
        NSLayoutConstraint.activate([
            imageThree.leadingAnchor.constraint(equalTo: imageTwo.trailingAnchor, constant: 8),
          //  imageThree.trailingAnchor.constraint(equalTo: imageFour.leadingAnchor, constant: -8),
            imageThree.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            imageThree.heightAnchor.constraint(equalToConstant: 70),
           // imageThree.widthAnchor.constraint(equalToConstant: 85),
            imageThree.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
        NSLayoutConstraint.activate([
            imageFour.leadingAnchor.constraint(equalTo: imageThree.trailingAnchor, constant: 8),
            imageFour.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            imageFour.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            imageFour.heightAnchor.constraint(equalToConstant: 70),
            imageFour.widthAnchor.constraint(equalToConstant: 85),
            imageFour.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])

    }
}

