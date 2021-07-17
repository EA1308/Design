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
//        self.navigationController?.isNavigationBarHidden = false
        
        let vc = FavoritesViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.tabBarItem.image = UIImage(named: "ic_heart")
//        vc.title = "Favorite"
        
        self.navigationController?.viewControllers = [vc]
//        navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
    
    }
    
    func start() {
        
    }
    
    
}
