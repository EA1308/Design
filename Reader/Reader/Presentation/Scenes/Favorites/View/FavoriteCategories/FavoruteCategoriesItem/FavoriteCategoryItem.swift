//
//  FavoriteCategoryItem.swift
//  Reader
//
//  Created by MacBook  on 17.07.21.
//

import UIKit

class FavoriteCategoryItem: UICollectionViewCell {

    @IBOutlet weak var labelCategory: UILabel!
    @IBOutlet weak var indicatorView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        indicatorView.layer.cornerRadius = 5
    }
    
    func configure(with category: String?) {
        labelCategory.text = category
    }

}
