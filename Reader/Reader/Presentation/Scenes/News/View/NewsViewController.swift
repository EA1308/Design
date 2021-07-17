//
//  CartViewController.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import UIKit

class NewsViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var viewModel: NewsViewModelProtocol!
    private var dataSource: NewsDataSource!
    private var newsManager: NewsManagerProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = "Today's News"
        collectionView.registerNib(class: GridItem.self)
        configureDataSource()
        addNavigationButtons()
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

    func configureDataSource() {
        newsManager = NewsManager()
        viewModel = NewsViewModel(with: newsManager)
        dataSource = NewsDataSource(with: collectionView, viewModel: viewModel)
        dataSource.refresh()
    }
    
}
