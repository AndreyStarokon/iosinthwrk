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
        table.register(PostTableViewTabCell.self, forCellReuseIdentifier: PostTableViewTabCell.identifaer)
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
        let header = ProfileHeaderView()
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        250
    }
  
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewTabCell.identifaer, for: indexPath) as! PostTableViewTabCell
        cell.postCell.setupCell(post: posts[indexPath.row])
        return cell
    }
}
