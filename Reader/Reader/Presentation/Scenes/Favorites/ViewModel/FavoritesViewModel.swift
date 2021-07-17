//
//  FavoritesViewModel.swift
//  Reader
//
//  Created by MacBook  on 16.07.21.
//

import Foundation


protocol FavoritesViewModelProtocol {
    func fetchNews(completion: @escaping ([News]) -> Void)
    init(with newsManager: NewsManagerProtocol)
}

class FavoritesViewModel: FavoritesViewModelProtocol {
    private var newsManager: NewsManagerProtocol!
    required init(with newsManager: NewsManagerProtocol) {
        self.newsManager = newsManager
    }
    
    func fetchNews(completion: @escaping ([News]) -> Void) {
        newsManager.fetchProducts(completion: completion)
    }
}
