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
    var favouriteId: String?
    
    init(catId: String, breed: String, imageUrl: String, origin: String, temperament: String, description: String, imageId: String?, favouriteId: String?) {
        self.catId = catId
        self.breed = breed
        self.imageUrl = imageUrl
        self.origin = origin
        self.temperament = temperament
        self.description = description
        self.imageId = imageId
        self.favouriteId = favouriteId
    }
    
    static func == (lhs: CatViewModel, rhs: CatViewModel) -> Bool {
        lhs.catId == rhs.catId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(catId)
    }
    
    func setFavourite(service: CatsService, imageId: String?, favId: String?) {
        if let favId = favId {
            // Remove from favourites
            Task {
                do {
                    let _ = try await service.deleteFavourite(favId: favId)
                }
                catch let error as NetworkError {
                    print("ERROR REMOVING Favourite: \(error.localizedDescription)")
                }
                
                await MainActor.run {
                    self.favouriteId = nil
                }
            }
        } else if let imageId = imageId {
            // Add as favourite
            Task {
                var favouriteIdString: String?
                do {
                    let response = try await service.addAsFavourite(imageId: imageId)
                    favouriteIdString = "\(response.id)"
                } catch let error as NetworkError {
                    print("ERROR ADDING Favourite: \(error.localizedDescription)")
                }
                let favId = favouriteIdString
                
                await MainActor.run {
                    if let favId = favId, !favId.isEmpty {
                        favouriteId = favId
                    }
                }
            }
        }
    }
}
