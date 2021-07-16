//
//  RecentItem.swift
//  Reader
//
//  Created by MacBook  on 16.07.21.
//

import UIKit

class RecentItem: UICollectionViewCell {

    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelCategory: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imgSmall: UIImageView!
    @IBOutlet weak var imgBig: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureImages()
      
    }

    func configureImages() {
        imgBig.layer.cornerRadius = 30
        imgSmall?.layer.cornerRadius = (imgSmall?.frame.size.width ?? 0.0) / 2
        imgSmall?.clipsToBounds = true
        imgSmall?.layer.borderWidth = 3.0
        imgSmall?.layer.borderColor = UIColor.white.cgColor
    }
    
    func configure(with item: News?) {
//        labelTime.text = item?.time
        labelCategory.text = item?.dateDay
        labelDescription.text = item?.description
        labelName.text = item?.dateYear
        let imgURL = URL(string: item?.imageURL ?? "")
        imgBig.kf.setImage(with: imgURL)
        imgSmall.kf.setImage(with: imgURL)

    }
    
}
