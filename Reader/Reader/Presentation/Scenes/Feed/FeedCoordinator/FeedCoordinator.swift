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
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor(hex: "4D009A")
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        let vc = FeedViewController.instantiateFromStoryboard()
        vc.coordinator = self
        self.navigationController?.viewControllers = [vc]
    
    }    
    
}
