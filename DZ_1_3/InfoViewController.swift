//
//  InfoViewController.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 16.03.2022.
//

import UIKit

class InfoViewController: UIViewController{
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 650, width: 200, height: 52))
        button.setTitle("Показать алерт", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        view.addSubview(button)
        button.addTarget(self, action: #selector(alertView), for: .touchUpInside)
        

    }
   override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
}
    @objc func alertView() {
        let alert = UIAlertController(title: "My Alert", message: "какой-то аллерт", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("отмена", comment: "2"), style: .cancel, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
