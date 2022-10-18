//
//  Post.swift
//  Navigation
//
//  Created by MacBook Air on 22.09.2022.
//

import Foundation
import UIKit

struct Post {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

let post1 = Post(author: "Olivia Johnson",
                 description: "The style of a tea room is known as sukiya. They are typically made of wood and covered with tatami mats where guests sit during the ceremony. There is also a nook in the room called a Tokonoma, the most important area, where there is a vase of flowers, and a calligraphy scroll is hung.\n\n\n",
                 image: "teaRoom",
                 likes: 501,
                 views: 721)
let post2 = Post(author: "Amaliya Harris",
                description: "Around the end of the 12th century, the style of tea preparation called tencha (点茶), in which powdered matcha was placed into a bowl, hot water added, and the tea and hot water whipped together, was introduced to Japan by Buddhist monk Eisai on his return from China. He also took tea seeds back with him, which eventually produced tea that was considered to be the most superb quality in all of Japan.\n\n\n",
                image: "teaCeremony",
                likes: 343,
                views: 478)
let post3 = Post(author: "Robert Collins",
                 description: "tea cup\n\n\n",
                 image: "teaCup",
                 likes: 1280,
                 views: 700)
let post4 = Post(author: "David Grant",
                 description: "The oldest public Japanese garden in the United States, this complex of many paths, ponds and a teahouse features plants and trees pruned and arranged in a Japanese style. The garden's 3 acres contain sculptures and structures influenced by Buddhist and Shinto religious beliefs, as well as many elements of water and rocks to create a calming landscape designed to slow people down.\n\n\n",
                 image: "teaGarden",
                 likes: 900,
                 views: 1250)

var post: [Post] = [post1, post2, post3, post4]

