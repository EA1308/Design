//
//  RecentCell.swift
//  Reader
//
//  Created by MacBook  on 16.07.21.
//

import UIKit

class RecentCell: UITableViewCell {

    @IBOutlet weak var recentlyCellCollectionView: UICollectionView!
    private var newsManager: NewsManager!
    private var recentlyDataSource: RecentlyCellCollectionViewDataSource!
    private var viewModel: FeedViewModelProtocol!
    
    private var recentlyCellDataSource: RecentlyCellCollectionViewDataSource!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        recentlyCellCollectionView.registerNib(class: RecentItem.self)
    }

    
    func configure() {
        configureDataSource()
    }
    
    func configureDataSource() {
        newsManager = NewsManager()
        viewModel = FeedViewModel(with: newsManager)
        recentlyDataSource = RecentlyCellCollectionViewDataSource(with: recentlyCellCollectionView, viewModel: viewModel)
        recentlyDataSource.refresh()
        
    }
}
