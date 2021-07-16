//
//  FeedCategoryCell.swift
//  Reader
//
//  Created by MacBook  on 16.07.21.
//

import UIKit

class FeedCategoryCell: UICollectionViewCell {

    @IBOutlet weak var viewIndicator: UIView!
    @IBOutlet weak var labelCategory: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewIndicator.layer.cornerRadius = 3
    }

    func configure(with category: (String,Bool)) {
        labelCategory.text = category.0
    }

    
}
