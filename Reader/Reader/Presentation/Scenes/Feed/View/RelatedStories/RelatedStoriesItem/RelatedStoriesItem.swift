//
//  RelatedStoriesItem.swift
//  Reader
//
//  Created by MacBook  on 16.07.21.
//

import UIKit

class RelatedStoriesItem: UICollectionViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imgPoster: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgPoster.layer.cornerRadius = 30
    }
    
   func configure(with item: News?) {
    labelTitle.text = item?.description
        let imgURL = URL(string: item?.imageURL ?? "")
        imgPoster.kf.setImage(with: imgURL)
    }

}
