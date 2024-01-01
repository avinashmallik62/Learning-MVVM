//
//  APIManager.swift
//  GoodNews
//
//  Created by Avinash Kumar on 01/01/24.
//  Copyright © 2024 Avinash Kumar. All rights reserved.
//

import Foundation
class APIManager {
    func fetchArticles(completionHandler: @escaping ([Articles]) -> ()) {
        let urlString = "https://newsapi.org/v2/everything?q=tesla&from=2023-12-01&sortBy=publishedAt&apiKey=6090c38f8e8d48c6a7523c95441ff93d"
        
        let url = URL(string: urlString)!
        
        WebService().getArticles(url: url) { articles in
            if let articles = articles {
                completionHandler(articles)
            }
        }
    }
}
