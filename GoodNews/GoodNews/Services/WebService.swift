//
//  WebService.swift
//  GoodNews
//
//  Created by Avinash Kumar on 01/01/24.
//  Copyright © 2024 Avinash Kumar. All rights reserved.
//

import Foundation
class WebService {
    
    func getArticles(url: URL, completionHandler: @escaping ([Articles]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completionHandler(nil)
            } else if let data = data {
                let articles = self.decodeData(data: data)
                completionHandler(articles)
            }
        }.resume()
    }
    
    func decodeData(data: Data) -> [Articles]? {
        let decoder = JSONDecoder()
        do {
            let article = try decoder.decode(ArticleModel.self, from: data)
            return article.articles
        } catch {
            
        }
        return nil
    }
}
