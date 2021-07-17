//
//  FavoriteNewsCellDataSource.swift
//  Reader
//
//  Created by MacBook  on 17.07.21.
//

import UIKit

class FavoritesNewsDataSource: NSObject {
    private var favoritesNewsCollectionView: UICollectionView!
    private var viewModel: FavoritesViewModelProtocol!
    private var newsList: [News]?
    
    
    init(with collectionView: UICollectionView, viewModel: FavoritesViewModelProtocol) {
        super.init()
        self.favoritesNewsCollectionView = collectionView
        self.viewModel = viewModel
        self.favoritesNewsCollectionView.dataSource = self
        self.favoritesNewsCollectionView.delegate = self
        self.favoritesNewsCollectionView.registerNib(class: NewsCellItem.self)
        self.favoritesNewsCollectionView.backgroundColor = .clear
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.favoritesNewsCollectionView.contentInset = UIEdgeInsets(top: 0, left: -UIScreen.main.bounds.width / 2,
                                                                     bottom: 0, right: 0)
        self.favoritesNewsCollectionView.collectionViewLayout = layout

    
    }
    
    func refresh() {
        viewModel.fetchNews { [weak self] newsList in
            self?.newsList = newsList
            self?.favoritesNewsCollectionView.reloadData()
        }
    }
}

extension FavoritesNewsDataSource: UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(NewsCellItem.self, for: indexPath)
        cell.configure(with: newsList?[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 270, height: 390)
    }
    
}
