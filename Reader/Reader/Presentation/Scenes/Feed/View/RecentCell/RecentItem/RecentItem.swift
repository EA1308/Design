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
    }

    func configure(with item: News?) {
        labelTime.text = item?.time
        labelCategory.text = item?.dateDay
        labelDescription.text = item?.description
        labelName.text = item?.title
        let imgURL = URL(string: item?.imageURL ?? "")
        imgBig.kf.setImage(with: imgURL)
        imgSmall.kf.setImage(with: imgURL)

    }
    
}
