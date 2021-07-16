//
//  RecentCellDataSource.swift
//  Reader
//
//  Created by MacBook  on 16.07.21.
//

import UIKit

class RelatedStoryCellDataSource: NSObject {
    private var relatedStoryCollectionView: UICollectionView?
    private var feedViewModel: FeedViewModelProtocol!
    
    var newsList: [News]?
   
    
    init(with recentlyCellCollectionView: UICollectionView, viewModel: FeedViewModelProtocol) {
        super.init()
        self.feedViewModel = viewModel
        self.relatedStoryCollectionView = recentlyCellCollectionView
        self.relatedStoryCollectionView?.dataSource = self
        self.relatedStoryCollectionView?.delegate = self
        
        collectionViewLayout()
    }
    
    private func collectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        relatedStoryCollectionView?.isScrollEnabled = false
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 27 , height: 135)
        layout.minimumLineSpacing = 20
        relatedStoryCollectionView?.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        relatedStoryCollectionView?.collectionViewLayout = layout
    }
    
    
    func refresh() {
        feedViewModel.fetchNews { [weak self] news in
            self?.newsList = news
            self?.relatedStoryCollectionView?.reloadData()
        }
    }
    

    
}

extension RelatedStoryCellDataSource: UICollectionViewDataSource , UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(RelatedStoriesItem.self, for: indexPath)
        cell.configure(with: newsList?[indexPath.row] )
        return cell
    }
}
