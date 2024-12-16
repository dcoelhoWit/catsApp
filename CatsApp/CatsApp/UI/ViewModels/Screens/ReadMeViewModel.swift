//
//  ReadMeViewModel.swift
//  CatsApp
//
//  Created by Diogo Coelho on 15/12/2024.
//

import SwiftUI

@Observable
class ReadMeViewModel {
    var title: String
    var description: String
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}
