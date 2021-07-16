//
//  RelatedStoriesCell.swift
//  Reader
//
//  Created by MacBook  on 16.07.21.
//

import UIKit

class RelatedStoriesCell: UITableViewCell {

    @IBOutlet weak var relatedStoriesCollectionView: UICollectionView!
    private var newsManager: NewsManager!
    private var relatedStoryCellDataSource: RelatedStoryCellDataSource!
    private var viewModel: FeedViewModelProtocol!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        relatedStoriesCollectionView.registerNib(class: RelatedStoriesItem.self)
    }

    
    func configure() {
        configureDataSource()
    }
    
    func configureDataSource() {
        newsManager = NewsManager()
        viewModel = FeedViewModel(with: newsManager)
        relatedStoryCellDataSource = RelatedStoryCellDataSource(with: relatedStoriesCollectionView, viewModel: viewModel)
        relatedStoryCellDataSource.refresh()
    }
    
}
