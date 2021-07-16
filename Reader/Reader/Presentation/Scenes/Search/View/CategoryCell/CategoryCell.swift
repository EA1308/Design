//
//  CategoryCell.swift
//  Reader
//
//  Created by MacBook  on 16.07.21.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var categoryView: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        categoryView.clipsToBounds = true
        categoryView.layer.cornerRadius = 5;
        categoryView.layer.masksToBounds = true;
//        categoryView.layer.cornerRadius = 21
    }

    func configure(with category: String) {
        categoryLabel.text = category
    }
}
