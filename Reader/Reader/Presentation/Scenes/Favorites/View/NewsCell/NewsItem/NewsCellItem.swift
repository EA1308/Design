//
//  NewsItem.swift
//  Reader
//
//  Created by MacBook  on 17.07.21.
//

import UIKit

class NewsCellItem: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var labelDescription: UILabel!
    
    @IBOutlet weak var labelTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.layer.cornerRadius = 6
    }

    func configure(with news: News?) {
        labelTitle.text = news?.title
        labelDescription.text = news?.description
    }
}
