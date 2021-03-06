//
//  FeedDataSource.swift
//  Reader
//
//  Created by MacBook  on 16.07.21.
//

import UIKit

class FeedDataSource: NSObject {
    
    private var tableView: UITableView!
    private var viewModel: FeedViewModelProtocol!
    private var collectionView: UICollectionView!
    
    
    init(with tableView: UITableView, viewModel: FeedViewModelProtocol) {
        super.init()
       
        self.viewModel = viewModel
        self.viewModel = viewModel
        self.tableView = tableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
    }
}

extension FeedDataSource: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if indexPath.row == 0 {
            let cell = tableView.deque(RecentCell.self, for: indexPath)
            cell.configure()
            return cell
        }
        
        if indexPath.row == 1 {
            let cell = tableView.deque(RelatedStoriesCell.self, for: indexPath)
            cell.configure()
            return cell
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 300
        }
        if indexPath.row == 1 {
            return 230
        }
        
        return 0
    }
    
}
