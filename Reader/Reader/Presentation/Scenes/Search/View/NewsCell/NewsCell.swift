//
//  NewsCell.swift
//  Reader
//
//  Created by MacBook  on 16.07.21.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell {

    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var imageBig: UIImageView!
    @IBOutlet weak var imageSmall: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageBig.layer.cornerRadius = 8.0
        imageBig.clipsToBounds = true
        
    }
    
    func configure(with item: News?) {
        labelDescription.text = item?.description
        let imgURL = URL(string: item?.imageURL ?? "")
        imageBig.kf.setImage(with: imgURL)
    }
    
}
