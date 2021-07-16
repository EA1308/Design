//
//  FeedCategoryCellViewModel.swift
//  Reader
//
//  Created by MacBook  on 16.07.21.
//

import  UIKit

class FeedCategoryDataSource: NSObject {
    private var feedCategoryCollectionView: UICollectionView?
//    private var searchDataSource: SearchDataSource!
    private var categoryItems = ["Recent", "Popular", "Nearby"]
    
    init(with categoryCollectionView: UICollectionView ) {
        super.init()
//        self.searchDataSource = searchDataSource
        self.feedCategoryCollectionView = categoryCollectionView
        self.feedCategoryCollectionView?.dataSource = self
        self.feedCategoryCollectionView?.delegate = self
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: UIScreen.bo, height: 35)
//        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 50 , height: 60)

        categoryCollectionView.isScrollEnabled = true
        layout.scrollDirection = .horizontal

//               layout.minimumInteritemSpacing = 50
//               layout.minimumLineSpacing = 50
        categoryCollectionView.collectionViewLayout = layout
    }
    
}

extension FeedCategoryDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(FeedCategoryCell.self, for: indexPath)
        cell.configure(with: categoryItems[indexPath.row])
        return cell
    }
}

extension FeedCategoryDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 41)
    }
}

