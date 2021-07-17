//
//  CategoryCell.swift
//  Reader
//
//  Created by MacBook  on 16.07.21.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var viewCategory: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()

      configureViewCategory()
    }
    
    func configureViewCategory() {
        viewCategory.layer.masksToBounds = true
        viewCategory.layer.cornerRadius = 21
//        viewCategory.layer.borderWidth = 0.5
//        viewCategory.layer.borderColor = UIColor.gray.cgColor
        
    }
    
    func configureIndicator() {
        viewCategory.layer.borderWidth = 0.5
        viewCategory.layer.borderColor = UIColor.gray.cgColor
        viewCategory.backgroundColor = UIColor(hex: "D1C4E9")
        categoryLabel.textColor = UIColor(hex: "454553")
    }
    
    func configure(with category: String) {
        categoryLabel.text = category
    }
}
