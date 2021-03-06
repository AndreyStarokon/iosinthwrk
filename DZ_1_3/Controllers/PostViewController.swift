//
//  PostViewController.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 16.03.2022.
//

import UIKit
import AVFoundation
class PostViewController: UIViewController {
    var songs: [Songs] = []
    public var position: Int = 0
    var coordinator: FeedCoordinator?
    var Player = AVAudioPlayer()
    
    
    private lazy var playBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "play"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(playButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var stopBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "stop"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(stopButton(_:)), for: .touchUpInside)
        return button
    }()
    private lazy var pauseBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "pause"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(pauseButton(_:)), for: .touchUpInside)
        return button
    }()
    private lazy var nextBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "forward"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextSong), for: .touchUpInside)
        return button
    }()
    private lazy var previousBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "backward"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(prevSong), for: .touchUpInside)
        return button
    }()
    
    
    private let songLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()

    private func configSongs() {
        songs.append(Songs(nameSong: "Song1", author: "Pendulum"))
        songs.append(Songs(nameSong: "Song2", author: "Pendulum"))
        songs.append(Songs(nameSong: "Song3", author: "Pendulum"))
        songs.append(Songs(nameSong: "Song4", author: "Pendulum"))
        let song = songs[position]
        let urlString = Bundle.main.path(forResource: song.nameSong, ofType: ".mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            guard let urlString = urlString else {
                return
            }
            Player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            

                    Player.prepareToPlay()
            
                }
                catch {
                    print("error")
                }
                
                
            }
    private func setupView() {
            view.backgroundColor = .white
            let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTap))
            navigationItem.rightBarButtonItems = [add]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Post"
        view.backgroundColor = .white
        setupView()
        layout()
        configSongs()
    }
    @objc func playButton(_ sender: Any) {
        Player.play()
        let song = songs[position]
        self.songLabel.text = song.nameSong
           
        }
        
       @objc func stopButton(_ sender: Any) {
        
               Player.stop()
                Player.currentTime = 0
               self.songLabel.text = ""
           }
    @objc func pauseButton(_ sender: Any) {
        Player.pause()
         }
    @objc func nextSong() {
        if position > 0 {
            position = position - 1
            Player.stop()
            configSongs()
            
        }
    }
    
    @objc func prevSong() {
        if position < (songs.count - 1) {
            position = position + 1
            Player.stop()
            configSongs()
            
        }
    }

    @objc  func didTap() {
        let infoVc = InfoViewController()
        navigationController?.present(infoVc, animated: true)
  }
    private func layout() {
        view.addSubview(playBtn)
        view.addSubview(stopBtn)
        view.addSubview(pauseBtn)
        view.addSubview(songLabel)
        view.addSubview(nextBtn)
        view.addSubview(previousBtn)
        
        NSLayoutConstraint.activate([
        playBtn.trailingAnchor.constraint(equalTo: pauseBtn.leadingAnchor, constant: -16),
        playBtn.topAnchor.constraint(equalTo: songLabel.bottomAnchor, constant: 10),
        playBtn.heightAnchor.constraint(equalToConstant: 40),
        playBtn.widthAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
        previousBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 160),
        previousBtn.topAnchor.constraint(equalTo: playBtn.bottomAnchor, constant: 10),
        previousBtn.heightAnchor.constraint(equalToConstant: 40),
        previousBtn.widthAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
        nextBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -160),
        nextBtn.topAnchor.constraint(equalTo: playBtn.bottomAnchor, constant: 10),
        nextBtn.heightAnchor.constraint(equalToConstant: 40),
        nextBtn.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
        stopBtn.leadingAnchor.constraint(equalTo: pauseBtn.trailingAnchor, constant: 16),
        stopBtn.topAnchor.constraint(equalTo: songLabel.bottomAnchor, constant: 10),
        stopBtn.heightAnchor.constraint(equalToConstant: 40),
        stopBtn.widthAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
        pauseBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        pauseBtn.topAnchor.constraint(equalTo: songLabel.bottomAnchor, constant: 10),
        pauseBtn.heightAnchor.constraint(equalToConstant: 40),
        pauseBtn.widthAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
        songLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        songLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
        songLabel.heightAnchor.constraint(equalToConstant: 40),
        songLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
