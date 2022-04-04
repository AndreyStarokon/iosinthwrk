//
//  TableViewCell.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 31.03.2022.
//

import UIKit


class CustomViewTabCell: UITableViewCell {
    
    let profileHeaderView = ProfileHeaderView()
    
    
    
    
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        custmizeCell()
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupCell(post: Post) {
        
    }
    
    private func custmizeCell() {
        contentView.addSubview(profileHeaderView)
        NSLayoutConstraint.activate([
              profileHeaderView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
              profileHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
              profileHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
              profileHeaderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
              profileHeaderView.heightAnchor.constraint(equalToConstant: 100)
             ])
        contentView.addSubview(statusButton)
        contentView.addSubview(profileImage)
        contentView.addSubview(statusText)
        contentView.addSubview(nameBar)
     
        NSLayoutConstraint.activate([
        profileImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -250),
        profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
        profileImage.heightAnchor.constraint(equalToConstant: 120 )
        ])
    
        NSLayoutConstraint.activate([
        statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        statusButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16),
        statusButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        NSLayoutConstraint.activate([
        statusText.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34),
        statusText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150),
        statusText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
        nameBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
        nameBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -150),
        nameBar.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    
}

