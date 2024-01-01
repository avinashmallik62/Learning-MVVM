//
//  ArticleModel.swift
//  GoodNews
//
//  Created by Avinash Kumar on 01/01/24.
//  Copyright © 2024 Avinash Kumar. All rights reserved.
//

import Foundation

struct ArticleModel: Codable {
    let articles: [Articles]
}

struct Articles: Codable {
    let title: String
    let description: String
}
