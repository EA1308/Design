//
//  FavoritesDataSource.swift
//  Reader
//
//  Created by MacBook  on 16.07.21.
//

import UIKit

class FavoritesDataSource: NSObject {
    private var tableView: UITableView!
    private var viewModel: FavoritesViewModelProtocol!
    private var newsList: [News]?
    
    init(with tableView: UITableView, viewModel: FavoritesViewModelProtocol) {
        super.init()
        self.viewModel = viewModel
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .none
    }
    
    func refresh() {
        viewModel.fetchNews { [weak self] newsList in
            self?.newsList = newsList
            self?.tableView.reloadData()
        }
    }
}

extension FavoritesDataSource: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.deque(FavoriteCategoriesCell.self, for: indexPath)
            cell.backgroundColor = .clear
            return cell
        }
        if indexPath.row == 1 {
            let cell = tableView.deque(FavoritesNewsCell.self, for: indexPath)
            cell.backgroundColor = .clear
            cell.configure()
            return cell
        }
        
        return .init()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 60
        }
        if indexPath.row == 1 {
            return 430
        }
        
        return .init()
    }
}
