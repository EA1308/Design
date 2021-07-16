//
//  FeedViewModel.swift
//  Reader
//
//  Created by MacBook  on 16.07.21.
//

import Foundation
protocol FeedViewModelProtocol {
    func fetchNews(completion: @escaping ([News]) -> Void)
    init(with newsManager: NewsManagerProtocol)
}

class FeedViewModel: FeedViewModelProtocol {
    private var newsManager: NewsManagerProtocol!
    required init(with newsManager: NewsManagerProtocol) {
        self.newsManager = newsManager
    }
    
    func fetchNews(completion: @escaping ([News]) -> Void) {
        newsManager.fetchProducts(completion: completion)
    }
}
