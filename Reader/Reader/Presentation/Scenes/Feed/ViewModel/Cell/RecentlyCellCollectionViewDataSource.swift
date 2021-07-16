//
//  RecentlyCellCollectionViewDataSource.swift
//  Reader
//
//  Created by MacBook  on 16.07.21.
//

import UIKit

class RecentlyCellCollectionViewDataSource: NSObject {
    private var recentlyCellCollectionView: UICollectionView?
    private var feedViewModel: FeedViewModelProtocol!
    
    var newsList: [News]?
//    private var searchDataSource: SearchDataSource!
   
    
    init(with recentlyCellCollectionView: UICollectionView, viewModel: FeedViewModelProtocol) {
        super.init()
//        self.searchDataSource = searchDataSource
        self.feedViewModel = viewModel
        self.recentlyCellCollectionView = recentlyCellCollectionView
        self.recentlyCellCollectionView?.dataSource = self
        self.recentlyCellCollectionView?.delegate = self
        
        collectionViewLayout()
    }
    
    private func collectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        recentlyCellCollectionView?.isScrollEnabled = false
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40 , height: 107)
        layout.minimumLineSpacing = 20
        recentlyCellCollectionView?.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        recentlyCellCollectionView?.collectionViewLayout = layout
    }
    
    
    func refresh() {
        feedViewModel.fetchNews { [weak self] news in
            self?.newsList = news
            self?.recentlyCellCollectionView?.reloadData()
        }
    }
    

    
}

extension RecentlyCellCollectionViewDataSource: UICollectionViewDataSource , UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(RecentItem.self, for: indexPath)
        cell.configure(with: newsList?[indexPath.row] )
        return cell
    }
}
