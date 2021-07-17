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
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor(hex: "505AEF")
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        let vc = NewsViewController.instantiateFromStoryboard()
        vc.coordinator = self
        
        self.navigationController?.viewControllers = [vc]
    
    }
    
    func start() {
        
    }
    
    
}
