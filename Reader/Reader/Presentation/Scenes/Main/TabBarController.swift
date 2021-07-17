//
//  TabBarController.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import UIKit

class TabBarController: UITabBarController, Storyboarded, CoordinatorDelegate {
    var coordinator: CoordinatorProtocol?
    
    private var favoritesCoordinator = FavoritesCoordinator()
    private var searchCoordinator = SearchCoordinator()
    private var newsCoordinator = NewsCoordinator()
    private var feedCoordinator = FeedCoordinator()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            feedCoordinator.navigationController!,
            searchCoordinator.navigationController!,
            newsCoordinator.navigationController!,
            favoritesCoordinator.navigationController!,
        ]
    }
    

}
