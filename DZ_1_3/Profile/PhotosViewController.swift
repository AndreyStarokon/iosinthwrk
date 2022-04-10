//
//  PhotosViewController.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 09.04.2022.
//

import Foundation
import UIKit



class PhotosViewController: UIViewController {
    
    private var images = [UIImage]()
    
    private lazy var photoCollection:UICollectionView = {
      let layout = UICollectionViewFlowLayout()
        let photoCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        photoCollection.translatesAutoresizingMaskIntoConstraints = false
        photoCollection.backgroundColor = .white
        photoCollection.delegate = self
        photoCollection.dataSource = self
        photoCollection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifaer)
        return photoCollection
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo Gallery"
        navigationController?.isNavigationBarHidden = false
        layout()
        for i in 1...20{
            let image = UIImage(named: "image\(i)")!
            images.append(image)
        }
        
    }
    
    private func layout(){
        view.addSubview(photoCollection)
        NSLayoutConstraint.activate([
            photoCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photoCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photoCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photoCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
}

// mark
extension PhotosViewController: UICollectionViewDelegate {
   
    
    
    
    
}


// mark

extension PhotosViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifaer, for: indexPath) as! PhotosCollectionViewCell
        let image = images[indexPath.item]
        cell.imageView.image = image
        return cell
    }
    
}


extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    private var sideInset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - sideInset * 4) / 3
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }
}
