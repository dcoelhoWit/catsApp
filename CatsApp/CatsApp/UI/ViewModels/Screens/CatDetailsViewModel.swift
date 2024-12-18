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
    var cat: CatViewModel
    
    init(cat: CatViewModel) {
        self.cat = cat
    }
}
