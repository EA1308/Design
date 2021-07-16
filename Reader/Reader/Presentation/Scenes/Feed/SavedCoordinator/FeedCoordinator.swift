//
//  SavedCoordinator.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import UIKit


final class FeedCoordinator: CoordinatorProtocol {
    
  
    var navigationController: UINavigationController?

    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
//        self.navigationController?.isNavigationBarHidden = true
        
        let vc = FeedViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.tabBarItem.image = UIImage(named: "ic_home")
        vc.title = "Feed"
        
        self.navigationController?.viewControllers = [vc]
    
    }
    
    func start() {
        
    }
    
    
}
