//
//  SearchViewController.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import UIKit

class SearchViewController: BaseViewController, UISearchBarDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    private var categoryCollectionViewDataSource: CategoryCollectionViewDataSource!
    private var searchDataSource: SearchDataSource!
    private var searchViewModel: SearchViewModelProtocol!
    private var newsManager: NewsManagerProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchBar()
        categoryCollectionView.registerNib(class: CategoryCell.self)
        tableView.registerNib(class: NewsCell.self)
         configureDataSource()
    }
    
    func configureSearchBar() {
        searchBar.clipsToBounds = true
        searchBar.borderStyle = .none
        searchBar.layer.cornerRadius = 23
    }
    

    func configureDataSource() {
        newsManager = NewsManager()
        searchViewModel = SearchViewModel(with: newsManager)
        searchDataSource = SearchDataSource(with: tableView,
                                            viewModel: searchViewModel)
        categoryCollectionViewDataSource = CategoryCollectionViewDataSource(with: categoryCollectionView,     searchDataSource: searchDataSource)
        searchDataSource.refresh()
        
        
    }
    
}



