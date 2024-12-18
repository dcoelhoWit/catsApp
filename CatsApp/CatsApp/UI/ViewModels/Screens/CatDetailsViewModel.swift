//
//  CatDetailsViewModel.swift
//  CatsApp
//
//  Created by Diogo Coelho on 18/12/2024.
//

import SwiftUI
import UIKit

@Observable
class CatDetailsViewModel {
    var service: CatsService
    var cat: CatViewModel
    
    init(service: CatsService, cat: CatViewModel) {
        self.service = service
        self.cat = cat
    }
}
