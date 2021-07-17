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
        addNavigationButtons()
        registerNibs()
        configureFeedCategoryCollectionView()
        configureTableView()
        navigationController?.navigationBar.topItem?.title = "My Feeds"

    }
    
    func registerNibs() {
        feedCategoryCollectionView.registerNib(class: FeedCategoryCell.self)
        tableView.registerNib(class: RecentCell.self)
        tableView.registerNib(class: RelatedStoriesCell.self)
    }
    
    func addNavigationButtons() {
        let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        rightButton.setBackgroundImage(UIImage(named: "ic_search"), for: .normal)
        rightButton.addTarget(self, action: #selector(handleRightButton), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        self.navigationItem.rightBarButtonItem?.tintColor = .white

        
        let leftButton = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 16))
        leftButton.setBackgroundImage(UIImage(named: "ic_menu"), for: .normal)
        leftButton.addTarget(self, action: #selector(handleLeftButton), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
    
    @objc func handleRightButton() {
        print("rightButton")
    }
    
    @objc func handleLeftButton() {
        print("leftButton")
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
