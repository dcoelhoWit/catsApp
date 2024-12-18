//
//  CatEntryModel.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import Foundation

struct CatEntryModel: Decodable {
    var id: String
    var name: String
    var referenceImageId: String?
    var origin: String
    var temperament: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case referenceImageId = "reference_image_id"
        case origin
        case temperament
        case description
    }
}
