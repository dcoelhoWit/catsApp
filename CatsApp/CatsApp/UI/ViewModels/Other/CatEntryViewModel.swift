//
//  CatEntryViewModel.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import SwiftUI

@Observable
class CatEntryViewModel {
    var catId: String
    var breed: String
    var favorite: Bool
    
    init(catId: String, breed: String, favorite: Bool) {
        self.catId = catId
        self.breed = breed
        self.favorite = favorite
    }
}
