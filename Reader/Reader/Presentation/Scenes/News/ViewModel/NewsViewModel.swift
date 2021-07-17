//
//  NewsViewModel.swift
//  Reader
//
//  Created by MacBook  on 16.07.21.
//

import Foundation


protocol NewsViewModelProtocol {
    func fetchNews(completion: @escaping ([News]) -> Void)
    init(with newsManager: NewsManagerProtocol)
}

class NewsViewModel: NewsViewModelProtocol {
    private var newsManager: NewsManagerProtocol!
    required init(with newsManager: NewsManagerProtocol) {
        self.newsManager = newsManager
    }
    
    func fetchNews(completion: @escaping ([News]) -> Void) {
        newsManager.fetchProducts(completion: completion)
    }
}
