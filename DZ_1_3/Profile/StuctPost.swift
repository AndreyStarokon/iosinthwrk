//
//  StuctPost.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 16.03.2022.
//

import UIKit



public struct Post {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
    static func makePost() -> [Post] {
        var post = [Post]()
        post.append(Post(author: "Jhon", description: "биток подрос", image: "bitkoin", likes: 123, views: 1145))
        post.append(Post(author: "Виталик", description: "цена достигла 3500", image: "etherium", likes: 723, views: 145))
        post.append(Post(author: "Тетя Глаша", description: "В гречке содержится много витаминов и полезных минералов: В1, В2, В6, фолиевая кислота, кальций, магний, железо, калий. К положительным свойствам относится и то, что эта крупа понижает уровень холестерина в крови, чистит печень от токсинов, обеспечивает правильную работу кишечника, улучшает процесс кроветворения и, как ни странно, борется с бессонницей».", image: "гречка", likes: 44443, views: 9999))
        post.append(Post(author: "obert", description: "Buy PIR detector", image: "123", likes: 23, views: 45))
        
        return post
    }
}

