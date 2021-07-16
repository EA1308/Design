//
//  CartCoordinator.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import UIKit


final class NewsCoordinator: CoordinatorProtocol {
    
  
    var navigationController: UINavigationController?

    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
        self.navigationController?.isNavigationBarHidden = true
        
        let vc = FavoritesViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.tabBarItem.image = UIImage(named: "newspaper")
        
        self.navigationController?.viewControllers = [vc]
    
    }
    
    func start() {
        
    }
    
    
}
