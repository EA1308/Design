//
//  HomeCoordinator.swift
//  BookStoreApp
//
//  Created by MacBook  on 12.07.21.
//

import UIKit

final class FavoritesCoordinator: CoordinatorProtocol {
    
  
    var navigationController: UINavigationController?

    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
        self.navigationController?.isNavigationBarHidden = true
        
        let vc = FavoritesViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.tabBarItem.image = UIImage(named: "ic_heart")
        vc.title = "Favorite"
        
        self.navigationController?.viewControllers = [vc]
    
    }
    
    func start() {
        
    }
    
    
}
