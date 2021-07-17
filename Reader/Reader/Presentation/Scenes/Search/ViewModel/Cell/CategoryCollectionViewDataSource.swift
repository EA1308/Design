//
//  CategoryCollectionViewDataSource.swift
//  Reader
//
//  Created by MacBook  on 16.07.21.
//

import UIKit

class CategoryCollectionViewDataSource: NSObject {
    private var categoryCollectionView: UICollectionView?
    private var searchDataSource: SearchDataSource!
    private var menuItems = ["Latest", "Featured", "Nearby", "Popular"]
    private var isSelected = 0

    
    init(with categoryCollectionView: UICollectionView, searchDataSource: SearchDataSource ) {
        super.init()
        self.searchDataSource = searchDataSource
        self.categoryCollectionView = categoryCollectionView
        self.categoryCollectionView?.dataSource = self
        self.categoryCollectionView?.delegate = self
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        categoryCollectionView.isScrollEnabled = true
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        categoryCollectionView.collectionViewLayout = layout
    }
    
}

extension CategoryCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(CategoryCell.self, for: indexPath)
        if indexPath.row == isSelected {
            cell.configureIndicator()
        } else {
            cell.configureViewCategory()
        }
        cell.configure(with: menuItems[indexPath.row])
        return cell
    }
}
extension CategoryCollectionViewDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        isSelected = indexPath.row
        collectionView.reloadData()
    }
    
    
}

extension CategoryCollectionViewDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 70)
    }
}



