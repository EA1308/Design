//
//  FeedCategoryCellViewModel.swift
//  Reade5
//
//  Created by MacBook  on 16.07.21.
//

import  UIKit

class FeedCategoryDataSource: NSObject {
    private var feedCategoryCollectionView: UICollectionView?
    private var categoryItems = [("Recent",true), ("Popular",false), ("Nearby",false)]
    private var isSelected = 0
    
    init(with categoryCollectionView: UICollectionView ) {
        super.init()
        self.feedCategoryCollectionView = categoryCollectionView
        self.feedCategoryCollectionView?.dataSource = self
        self.feedCategoryCollectionView?.delegate = self
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3  , height: 55)
        categoryCollectionView.isScrollEnabled = true
        layout.scrollDirection = .horizontal
        categoryCollectionView.collectionViewLayout = layout
    }
    
}

extension FeedCategoryDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(FeedCategoryCell.self, for: indexPath)
        if indexPath.row == isSelected {
            cell.viewIndicator.backgroundColor =  UIColor(hex: "005AEE")
        } else {
            cell.viewIndicator.backgroundColor = .gray
        }
        cell.configure(with: categoryItems[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        isSelected = indexPath.row
        collectionView.reloadData()
    }
}

extension FeedCategoryDataSource: UICollectionViewDelegateFlowLayout {

}

