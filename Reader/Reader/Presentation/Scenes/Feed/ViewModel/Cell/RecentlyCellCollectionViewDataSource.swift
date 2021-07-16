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
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: UIScreen.bo, height: 35)
//        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 50 , height: 60)
//        layout.sectionInset = cgf
        recentlyCellCollectionView.contentInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 15)

        recentlyCellCollectionView.isScrollEnabled = true
        layout.scrollDirection = .horizontal

//               layout.minimumInteritemSpacing = 50
//               layout.minimumLineSpacing = 50
        recentlyCellCollectionView.collectionViewLayout = layout
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
