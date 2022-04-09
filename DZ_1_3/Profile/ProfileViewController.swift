//
//  SecondViewController.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 06.03.2022.
//
import UIKit

class ProfileViewController: UIViewController {
    let posts = Post.makePost()
    
    private lazy var headerTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.dataSource = self
        table.delegate = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(PostTableViewTabCell.self, forCellReuseIdentifier: PostTableViewCell.identifaer)
    //    table.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotoViewCell.identifaer)

        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setupConstraint()
        
    }
    private func setupConstraint() {
        view.addSubview(headerTable)
        NSLayoutConstraint.activate([
            headerTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerTable.topAnchor.constraint(equalTo: view.topAnchor),
            headerTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        UITableView.automaticDimension
    }
    
    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var header: UIView?
        if section == 0 {
            header = ProfileHeaderView()
        }
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 250}
        else {
            return 0
        }
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return posts.count
        }
        else {
            return 1
      }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //    if indexPath.section == 1 {
        let cellOne = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifaer, for: indexPath) as! PostTableViewTabCell
       cellOne.postCell.setupCell(post: posts[indexPath.row])
        return cellOne
    //    }
    //    else {
    //    let cellTwo = tableView.dequeueReusableCell(withIdentifier: PhotoViewCell.identifaer, for: indexPath) as! PhotosTableViewCell
    //    return cellTwo
    //    }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
       1
    }
}
