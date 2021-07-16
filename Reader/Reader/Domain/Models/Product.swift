//
//  FavoritesViewModel.swift
//  Reader
//
//  Created by MacBook  on 16.07.21.
//

import Foundation

struct News: Codable {
    let title: String?
    let description: String?
    let imageURL: String?
    let time: String?
    let dateDay: String?
    let dateYear: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case description = "ShortDescription"
        case imageURL = "MediumCoverPhotoUrl"
        case time = "Time"
        case dateDay = "DateWithoutYear"
        case dateYear = "DateYear"
        
    }
    
}
