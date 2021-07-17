//
//  FavoriteCategoriesCell.swift
//  Reader
//
//  Created by MacBook  on 17.07.21.
//

import UIKit

class FavoriteCategoriesCell: UITableViewCell {

    @IBOutlet weak var favoriteCategoriesCollectionView: UICollectionView!
    private var dataSource: FavoriteCategoriesDataSource!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        dataSource = FavoriteCategoriesDataSource(with: favoriteCategoriesCollectionView)
    }
    
}
