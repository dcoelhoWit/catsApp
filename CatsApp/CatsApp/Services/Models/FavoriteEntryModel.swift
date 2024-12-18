//
//  FavouriteEntryModel.swift
//  CatsApp
//
//  Created by Diogo Coelho on 18/12/2024.
//

import Foundation

struct FavouriteEntryModel: Decodable {
    var id: Int
    var imageId: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case imageId = "image_id"
    }
}
