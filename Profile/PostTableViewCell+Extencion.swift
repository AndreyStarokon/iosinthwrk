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
    
    private let headerText: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    func setupHeader(text: String) {
        headerText.text = text
    }
    private func setupLayout() {
        addSubview(headerText)
        NSLayoutConstraint.activate([
        headerText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        headerText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        headerText.centerYAnchor.constraint(equalTo: centerYAnchor),
        headerText.heightAnchor.constraint(equalToConstant: 20 )
        ])
    }
}


extension UIView {
    static let identifaer = String(describing: self)
}

