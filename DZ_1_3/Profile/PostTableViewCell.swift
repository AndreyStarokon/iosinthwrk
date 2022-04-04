//
//  TableViewCell.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 31.03.2022.
//

import UIKit


class PostTableViewTabCell: UITableViewCell {
    
    let postCell = PostTableViewCell()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        custmizeCell()
        postCell.translatesAutoresizingMaskIntoConstraints = false

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func custmizeCell() {
        contentView.addSubview(postCell)
        postCell.backgroundColor = .white
        NSLayoutConstraint.activate([
              postCell.topAnchor.constraint(equalTo: contentView.topAnchor),
              postCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
              postCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
              postCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
              
             ])
       
    }
    
    
}

