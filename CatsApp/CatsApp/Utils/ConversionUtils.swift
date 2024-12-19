//
//  ConversionUtils.swift
//  CatsApp
//
//  Created by Diogo Coelho on 18/12/2024.
//

import Foundation

struct ConversionUtils {
    static func catsListConversion(models: [CatEntryModel], favouritesList: [FavouriteEntryModel] = []) -> [CatViewModel] {
        let catsViewModel = models.map {
            var imageUrl = ""
            var favouriteId: String? = nil
            if let refId = $0.referenceImageId, !refId.isEmpty {
                imageUrl = "https://cdn2.thecatapi.com/images/\(refId).jpg"
                
                let favouriteIdNumber = favouritesList.first {
                    return $0.imageId == refId
                }?.id
                
                if let favouriteIdNumber = favouriteIdNumber {
                    favouriteId = "\(favouriteIdNumber)"
                }
            }
            
            return CatViewModel(catId: $0.id, breed: $0.name, imageUrl: imageUrl, origin: $0.origin, temperament: $0.temperament, description: $0.description, imageId: $0.referenceImageId, favouriteId: favouriteId)
        }
        
        return catsViewModel
    }
}
