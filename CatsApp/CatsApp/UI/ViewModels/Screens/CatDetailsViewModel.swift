//
//  CatDetailsViewModel.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import SwiftUI

@Observable
class CatDetailsViewModel {
    var details: CatEntryDetailsModel
    
    init(details: CatEntryDetailsModel) {
        self.details = details
    }
}
