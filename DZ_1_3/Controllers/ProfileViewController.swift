//
//  SecondViewController.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 06.03.2022.
//
import UIKit
import iOSIntPackage
import Firebase
import FirebaseAuth

class ProfileViewController: UIViewController {
    var coordinator: ProfileCoordinator?
    
    private let stack: CoreDataStack
    let header = ProfileHeaderView()
    let posts = [Post(author: "тетя глаша",
                         description: "113",
                         image: "bitkoin",
                         likes: 100500,
                         views: 124567),
                    Post(author: "виталик",
                         description: "цена достигла 3500",
                         image: "etherium",
                         likes: 1276543,
                         views: 8765433),
                    Post(author: "jhon",
                         description: "В гречке содержится много витаминов и полезных минералов: В1, В2, В6, фолиевая кислота, кальций, магний, железо, калий. К положительным свойствам относится и то, что эта крупа понижает уровень холестерина в крови, чистит печень от токсинов, обеспечивает правильную работу кишечника, улучшает процесс кроветворения и, как ни странно, борется с бессонницей».",
                         image: "гречка",
                         likes: 987654,
                         views: 1224566),
                    Post(author: "obert",
                         description: "Buy PIR detector",
                         image: "123",
                         likes: 666,
                         views: 1245698765)
       ]
    
    init(stack: CoreDataStack) {
            self.stack = stack
            super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var imagePublisher = ImagePublisherFacade()
    
    private lazy var exitButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .blue
            button.setImage(UIImage(systemName: "clear"), for: .normal)
            button.layer.cornerRadius = 24/2
            button.layer.masksToBounds = true
            button.clipsToBounds = true
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(exitButtonPressed), for: .touchUpInside)
            return button
        }()
    
    private lazy var headerTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        #if DEBUG
        table.backgroundColor = .red
        #else
        table.backgroundColor = .systemGray6
        #endif
        table.dataSource = self
        table.delegate = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifaer)
        return table
    }()
    
       override func viewWillAppear(_ animated: Bool) {
            navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setupConstraint()
        view.backgroundColor = .red
    }
    
    @objc private func exitButtonPressed() {
           try! Auth.auth().signOut()
           coordinator?.closeButtonPressed()
       }
    
    private func setupConstraint() {
        view.addSubview(headerTable)
        view.addSubview(exitButton)
        NSLayoutConstraint.activate([
            headerTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerTable.topAnchor.constraint(equalTo: view.topAnchor),
            headerTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        NSLayoutConstraint.activate([
                    exitButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
                    exitButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
                    exitButton.widthAnchor.constraint(equalToConstant: 24),
                    exitButton.heightAnchor.constraint(equalToConstant: 24)
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
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifaer, for: indexPath) as! PostTableViewCell
                   cell.post = posts[indexPath.row]
                   cell.delegate = self
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
extension ProfileViewController: PostTableCellDelegate {
    func savePost(post: Post) {
        stack.createNewTask(author: post.author, description: post.description, image: post.image, likes: post.likes, views: post.views)
    }
}

protocol PostTableCellDelegate: AnyObject {
    func savePost(post: Post)
}
