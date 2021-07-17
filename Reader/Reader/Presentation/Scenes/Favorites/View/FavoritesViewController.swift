//
//  HomeViewController.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import UIKit

class FavoritesViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    private var viewModel: FavoritesViewModelProtocol!
    private var dataSource: FavoritesDataSource!
    private var newsManager: NewsManagerProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        configureDataSource()
      addNavigationButtons()
    }
    
    func configureDataSource() {
        newsManager = NewsManager()
        viewModel = FavoritesViewModel(with: newsManager)
        dataSource = FavoritesDataSource(with: tableView, viewModel: viewModel)
        dataSource.refresh()
    }
    
    func addNavigationButtons() {
        let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
        rightButton.setBackgroundImage(UIImage(named: "image-mask-1"), for: .normal)
        rightButton.addTarget(self, action: #selector(handleRightButton), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        
        
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
    
    func setupTableView() {
        self.tableView.backgroundColor = .clear
        tableView.registerNib(class: FavoriteCategoriesCell.self)
        tableView.registerNib(class: FavoritesNewsCell.self)
        
    }
    


}
