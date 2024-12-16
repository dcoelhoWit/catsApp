//
//  CatsListViewModel.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import SwiftUI

@Observable
class CatsListViewModel {
    var cats: [CatEntryViewModel]
    
    init(cats: [CatEntryViewModel]) {
        self.cats = cats
    }
}
