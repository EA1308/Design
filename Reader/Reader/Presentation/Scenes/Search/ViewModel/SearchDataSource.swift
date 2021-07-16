//
//  SearchDataSource.swift
//  Reader
//
//  Created by MacBook  on 16.07.21.
//

import UIKit

class SearchDataSource: NSObject {
    private var tableView: UITableView?
    private var viewModel: SearchViewModelProtocol?
    private var newsList: [News]?
    private var featuredList: [Featured]?
//    
    init(with tableView: UITableView, viewModel: SearchViewModelProtocol) {
        super.init()
        self.tableView = tableView
        self.viewModel = viewModel
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.separatorStyle = .none
    }
    
    func refresh() {
        viewModel?.fetchNews(completion: { [weak self] newsList in
            self?.newsList = newsList
            self?.tableView?.reloadData()
        })
    }
//
    func updateTableView(with category: Int) {
        print(category)

        if category == 0 {
            refresh()
        } else if category == 1 {
            newsList?.removeAll()
            let featured = Featured(title: "eka", imgName: "cover1")
            featuredList?.append(featured)

        }
    }
    
    
}


extension SearchDataSource: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.deque(NewsCell.self, for: indexPath)
        cell.configure(with: newsList?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row == 0{
//            updateTableView(with: 0)
//        } else {
//            updateTableView(with: 1)
//        }
//
//    }
}
