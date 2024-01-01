//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Avinash Kumar on 2/5/19.
//  Copyright © 2019 Avinash Kumar. All rights reserved.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var viewModel: ArticlesListViewModel?
    private var apiManager = APIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        apiManager.fetchArticles { articles in
            self.viewModel = ArticlesListViewModel(articles: articles)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.articles?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ArticleTableViewCell else { return UITableViewCell() }
        cell.titleLabel?.text = viewModel?.articles?[indexPath.row].title
        cell.descriptionLabel.text = viewModel?.articles?[indexPath.row].description
        return cell
    }
    
}
