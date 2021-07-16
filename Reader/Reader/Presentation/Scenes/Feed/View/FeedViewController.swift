//
//  SavedViewController.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import UIKit

class FeedViewController: BaseViewController {
    
    @IBOutlet weak var feedCategoryCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    private var feedCategoryDataSource: FeedCategoryDataSource!
    private var feedViewModel: FeedViewModelProtocol!
    private var feedDataSource: FeedDataSource!
    private var newsManager: NewsManagerProtocol!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedCategoryCollectionView.registerNib(class: FeedCategoryCell.self)
        configureFeedCategoryCollectionView()
        tableView.registerNib(class: RecentCell.self)
        tableView.registerNib(class: RelatedStoriesCell.self)
  
        configureTableView()
    }
    
    func configureFeedCategoryCollectionView() {
        feedCategoryDataSource = FeedCategoryDataSource(with: feedCategoryCollectionView)
    }

    func configureTableView() {
        newsManager = NewsManager()
        feedViewModel = FeedViewModel(with: newsManager)
        feedDataSource = FeedDataSource(with: tableView, viewModel: feedViewModel)
        
    }

    
}
