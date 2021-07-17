//
//  NewsDataSource.swift
//  Reader
//
//  Created by MacBook  on 16.07.21.
//

import UIKit

class NewsDataSource: NSObject {
    private var collectionView: UICollectionView!
    private var viewModel: NewsViewModelProtocol!
    private var newsList: [News]?
    
    init(with collectionView: UICollectionView, viewModel: NewsViewModelProtocol) {
        super.init()
        self.collectionView = collectionView
        self.viewModel = viewModel
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
        
    }
    
    func refresh() {
        viewModel.fetchNews { [weak self] news in
            self?.newsList = news
            self?.collectionView.reloadData()
        }
    }
    
}



extension NewsDataSource: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(GridItem.self, for: indexPath)
        cell.configure(with: newsList?[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: UIScreen.main.bounds.width - 34, height: 196)
        }
        return CGSize(width: UIScreen.main.bounds.width / 2 - 25, height: 184)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
      
        return UIEdgeInsets(top: 17, left: 17, bottom: 0, right: 17)
    }
    
}
