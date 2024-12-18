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
    var favorite: Bool
    var origin: String
    var temperament: String
    var description: String
    
    init(catId: String, breed: String, imageUrl: String, favorite: Bool, origin: String, temperament: String, description: String) {
        self.catId = catId
        self.breed = breed
        self.imageUrl = imageUrl
        self.favorite = favorite
        self.origin = origin
        self.temperament = temperament
        self.description = description
    }
    
    static func == (lhs: CatViewModel, rhs: CatViewModel) -> Bool {
        lhs.catId == rhs.catId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(catId)
    }
}
