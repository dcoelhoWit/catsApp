//
//  CatCellViewModel.swift
//  CatsApp
//
//  Created by Diogo Coelho on 18/12/2024.
//

import SwiftUI

@Observable
class CatCellViewModel {
    var service: CatsService
    var cat: CatViewModel
    
    init(service: CatsService, cat: CatViewModel) {
        self.service = service
        self.cat = cat
    }
}
