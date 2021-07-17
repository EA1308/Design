//
//  FavoriteCategoriesDataSource.swift
//  Reader
//
//  Created by MacBook  on 17.07.21.
//

import UIKit


class FavoriteCategoriesDataSource: NSObject, UICollectionViewDelegate {
    private var favoriteCategoriesCollectionView: UICollectionView!
    
    private var favoriteCategoris = ["My Favorites", "Book"]
    
    init(with collectionView: UICollectionView ) {
        super.init()
        self.favoriteCategoriesCollectionView = collectionView
        self.favoriteCategoriesCollectionView.dataSource = self
        self.favoriteCategoriesCollectionView.delegate = self
        self.favoriteCategoriesCollectionView.backgroundColor = .clear
        self.favoriteCategoriesCollectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 16)

        self.favoriteCategoriesCollectionView.registerNib(class: FavoriteCategoryItem.self)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        favoriteCategoriesCollectionView.isScrollEnabled = true
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        favoriteCategoriesCollectionView.collectionViewLayout = layout
        
    }
    
}

extension FavoriteCategoriesDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteCategoris.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(FavoriteCategoryItem.self, for: indexPath)
        cell.configure(with: favoriteCategoris[indexPath.row])
        cell.backgroundColor = .clear
        return cell
    }
}

extension FavoriteCategoriesDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 50)
    }
}
