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
    
    init(with categoryCollectionView: UICollectionView, searchDataSource: SearchDataSource ) {
        super.init()
        self.searchDataSource = searchDataSource
        self.categoryCollectionView = categoryCollectionView
        self.categoryCollectionView?.dataSource = self
        self.categoryCollectionView?.delegate = self
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        categoryCollectionView.isScrollEnabled = true
        layout.scrollDirection = .horizontal

               layout.minimumInteritemSpacing = 50
               layout.minimumLineSpacing = 50
        categoryCollectionView.collectionViewLayout = layout
    }
    
}

extension CategoryCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(CategoryCell.self, for: indexPath)
        cell.configure(with: menuItems[indexPath.row])
        return cell
    }
}
extension CategoryCollectionViewDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        searchDataSource.updateTableView(with: indexPath.row)
    }
    
    
}

extension CategoryCollectionViewDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 41)
        

        
    }
}



