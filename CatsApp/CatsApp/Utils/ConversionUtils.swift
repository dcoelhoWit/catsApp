//
//  ConversionUtils.swift
//  CatsApp
//
//  Created by Diogo Coelho on 18/12/2024.
//

import Foundation

struct ConversionUtils {
    static func catsListConversion(models: [CatEntryModel]) -> [CatViewModel] {
        let catsViewModel = models.map {
            var imageUrl = ""
            if let refId = $0.referenceImageId, !refId.isEmpty {
                imageUrl = "https://cdn2.thecatapi.com/images/\(refId).jpg"
            }
            return CatViewModel(catId: $0.id, breed: $0.name, imageUrl: imageUrl, favorite: false, origin: $0.origin, temperament: $0.temperament, description: $0.description)
        }
        
        return catsViewModel
    }
}
