//
//  CatViewModel.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import SwiftUI

@Observable
class CatViewModel: Hashable {
    var catId: String
    var breed: String
    var imageUrl: String
    var origin: String
    var temperament: String
    var description: String
    var imageId: String?
    var favoriteId: String?
    
    init(catId: String, breed: String, imageUrl: String, origin: String, temperament: String, description: String, imageId: String?, favoriteId: String?) {
        self.catId = catId
        self.breed = breed
        self.imageUrl = imageUrl
        self.origin = origin
        self.temperament = temperament
        self.description = description
        self.imageId = imageId
    }
    
    static func == (lhs: CatViewModel, rhs: CatViewModel) -> Bool {
        lhs.catId == rhs.catId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(catId)
    }
    
    func setFavorite(service: CatsService, imageId: String?, favId: String?) {
        if let imageId = imageId {
            // Add as favorite
            Task {
                do {
                    try await service.addAsFavorite(imageId: imageId)
                } catch let error as NetworkError {
                    print("ERROR SETTING FAVORITE: \(error.localizedDescription)")
                }
            }
        } else if let favId = favId {
            // Remove from favorites
            Task {
                do {
                    try await service.deleteFavorite(favId: favId)
                }
                catch let error as NetworkError {
                    print("ERROR SETTING FAVORITE: \(error.localizedDescription)")
                }
            }
        }
    }
}
