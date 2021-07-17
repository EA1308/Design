//
//  NewsCell.swift
//  Reader
//
//  Created by MacBook  on 17.07.21.
//

import UIKit

class FavoritesNewsCell: UITableViewCell {

    @IBOutlet weak var FavoritesNewsCollectionView: UICollectionView!
    
    private var dataSource: FavoritesNewsDataSource!
    private var viewModel: FavoritesViewModelProtocol!
    private var newsManager: NewsManagerProtocol!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        FavoritesNewsCollectionView.registerNib(class: NewsCellItem.self)
     
    }

    
    func configure() {
        configureDataSource()
    }
    
    func configureDataSource() {
        newsManager = NewsManager()
        viewModel = FavoritesViewModel(with: newsManager)
        dataSource = FavoritesNewsDataSource(with: FavoritesNewsCollectionView, viewModel: viewModel)
        dataSource.refresh()
        
    }
    
    
}
