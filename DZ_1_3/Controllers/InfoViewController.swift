//
//  InfoViewController.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 16.03.2022.
//

import UIKit


class InfoViewController: UIViewController{
    var coordinator: FeedCoordinator?
    
    private lazy var button = CustomButton(title: "Allert", color: .black, colorTitle: .white, borderWidth: 1, cornerRadius: 10) {
        let alert = UIAlertController(title: "My Alert", message: "какой-то аллерт", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("отмена", comment: "2"), style: .cancel, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        layout()
    }
   override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
}
    private func layout() {
        view.addSubview(button!)
        NSLayoutConstraint.activate([
        button!.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        button!.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        button!.heightAnchor.constraint(equalToConstant: 40),
        button!.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
   
}
