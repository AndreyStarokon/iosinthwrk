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
     //   table.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifaer)
        return table
    }()
    
       override func viewWillAppear(_ animated: Bool) {
            navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
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
        section == 0 ? 1 : posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0  {
           let cell = PhotosTableViewCell()
            return cell
       }
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewTabCell.identifaer, for: indexPath) as! PostTableViewTabCell
               cell.postCell.setupCell(post: posts[indexPath.row])
               return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
     2
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if indexPath == IndexPath(row: 0, section: 0) {
                tableView.deselectRow(at: indexPath, animated: true)

                let photosViewController = PhotosViewController()
                navigationController?.pushViewController(photosViewController, animated: true)
    }
   }
}
