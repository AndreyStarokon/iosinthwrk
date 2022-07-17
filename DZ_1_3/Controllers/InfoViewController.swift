//
//  InfoViewController.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 16.03.2022.
//

import UIKit


class InfoViewController: UIViewController{
    var coordinator: FeedCoordinator?
    let urlString = "https://jsonplaceholder.typicode.com/todos/42"
    let planetString = "https://swapi.dev/api/planets/5"
    
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
    
    private lazy var infoLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.backgroundColor = .cyan
            label.layer.cornerRadius = 16
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

        private lazy var planetLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.backgroundColor = .green
            label.layer.cornerRadius = 16
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
        getData()
        
    }
   override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
}
    private func layout() {
        view.addSubview(button!)
        view.addSubview(infoLabel)
        view.addSubview(planetLabel)
        NSLayoutConstraint.activate([
        button!.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        button!.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        button!.heightAnchor.constraint(equalToConstant: 40),
        button!.widthAnchor.constraint(equalToConstant: 300)
        ])
        NSLayoutConstraint.activate([
        infoLabel.bottomAnchor.constraint(equalTo: button!.topAnchor, constant: -16),
        infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        infoLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
        planetLabel.bottomAnchor.constraint(equalTo: infoLabel.topAnchor, constant: -16),
        planetLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        planetLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        planetLabel.heightAnchor.constraint(equalToConstant: 40)
                ])
    }
    
    private func getData() {
                let titleUrl = URL(string: urlString)
                let planetURL = URL(string: planetString)
                NetworkManager.infoDataTask(url: titleUrl!, block: printInLabel)
                NetworkManager.infoDataTask(url: planetURL!, block: printInPlanetLabel)
            }

    private func printInLabel(json: Data) {
                if let result = try? JSONSerialization.jsonObject(with: json, options: .mutableContainers) as? [String: Any] {
                    infoLabel.text = result["title"] as? String
                }
            }

    private func printInPlanetLabel(json: Data) {
                if let resultL = String(data: json, encoding: .utf8) {
                    print("RESULTL: \(resultL)")
                }

                if let result = try? JSONDecoder().decode(Planet.self, from: json) {
                    print("result: \(result)")
                    planetLabel.text = result.orbitalPeriod
                } else {
                    print("BAD RESULT")
                }
            }
    }
    
   
