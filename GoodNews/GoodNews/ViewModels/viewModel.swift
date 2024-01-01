//
//  viewModel.swift
//  GoodNews
//
//  Created by Avinash Kumar on 01/01/24.
//  Copyright © 2024 Avinash Kumar. All rights reserved.
//

import Foundation

class ArticlesListViewModel {
    var articles: [Articles]?
    
    init(articles: [Articles]? = nil) {
        self.articles = articles
    }
}
