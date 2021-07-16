//
//  ProductsManager.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import Foundation

protocol NewsManagerProtocol: AnyObject {
    func fetchProducts(completion: @escaping ([Product]) -> Void)
}

 class NewsManager: NewsManagerProtocol {
    func fetchProducts(completion: @escaping ([Product]) -> Void) {
        let url = "https://imedinews.ge/ge/~/api/getnews/get?skipCount=28&portion=20&categoryId=17&pageId=59"
        NetworkManager.shared.get(url: url) { (result: Result<[Product], Error>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    completion(response)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
