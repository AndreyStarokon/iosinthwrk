//
//  UIview+Extencion.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 31.03.2022.
//

import UIKit

class PostTableViewCell: UIView {
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupCell(post: Post) {
        postImage.image = post.image
        postViews.text = "Views:\(post.views)"
        postLikes.text = "Likes:\(post.likes)"
        authorText.text = post.author
        descriptionText.text = post.description
    }

    private let postLikes: UILabel = {
        let likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        return likes
    }()
    private let postViews: UILabel = {
        let views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()
    
    private let authorText: UILabel = {
        let author = UILabel()
        author.translatesAutoresizingMaskIntoConstraints = false
        return author
    }()
    private let descriptionText: UILabel = {
        let description = UILabel()
        description.textColor = .systemGray
        description.translatesAutoresizingMaskIntoConstraints = false
        description.numberOfLines = 0
        return description
    }()
    private let postImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
   
    private func setupLayout() {
        addSubview(authorText)
        addSubview(postImage)
        addSubview(postLikes)
        addSubview(postViews)
        addSubview(descriptionText)
        NSLayoutConstraint.activate([
            authorText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            authorText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            authorText.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            authorText.heightAnchor.constraint(equalToConstant: 20 )
        ])
        NSLayoutConstraint.activate([
            postImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            postImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            postImage.topAnchor.constraint(equalTo: authorText.bottomAnchor, constant: 10),
            postImage.heightAnchor.constraint(equalToConstant: 350)
        ])
        NSLayoutConstraint.activate([
            postLikes.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -160),
            postLikes.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            postLikes.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 10),
            postLikes.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
         //   postLikes.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            postViews.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            postViews.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
        //    postViews.heightAnchor.constraint(equalToConstant: 20),
            postViews.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            descriptionText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptionText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      //      descriptionText.bottomAnchor.constraint(equalTo: postLikes.topAnchor, constant: 20),
            descriptionText.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10)
        ])
    }
}


extension UIView {
    static let identifaer = String(describing: self)
}

