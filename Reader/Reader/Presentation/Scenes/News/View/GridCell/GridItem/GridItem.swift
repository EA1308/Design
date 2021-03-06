//
//  GridItem.swift
//  Reader
//
//  Created by MacBook  on 16.07.21.
//

import UIKit

class GridItem: UICollectionViewCell {

    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelCategory: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imgPoster: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        categoryView.layer.cornerRadius = 8
        imgPoster.layer.cornerRadius = 8
        categoryView.backgroundColor = .randomColor
    }
    
    func configure(with item: News?) {
        labelDescription.text = item?.description
        labelCategory.text = item?.dateDay
        labelTitle.text = item?.title
        let imgURL = URL(string: item?.imageURL ?? "")
        imgPoster.kf.setImage(with: imgURL)
    }

}
