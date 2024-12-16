//
//  CatsNetworkService.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import SwiftUI
import Combine

class CatsNetworkService: NetworkService, CatsService {
    func loadCatsList() async -> [CatEntryModel] {
        return []
    }
    
    func loadCatDetails(catId: String) async -> CatEntryDetailsModel {
        CatEntryDetailsModel()
    }
}
