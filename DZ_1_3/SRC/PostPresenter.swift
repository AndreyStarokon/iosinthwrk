//
//  PostPresenter.swift
//  VK_app
//
//  Created by Ffhh Qerg on 28.06.2022.
//

import Foundation
import UIKit


class PostPresenter: FeedViewOutput {
    var coordinator: FeedCoordinator?
        
    func showPost() {
        coordinator?.showPost()
    }
}
