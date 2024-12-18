//
//  CatsListViewModel.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import SwiftUI
import UIKit

@Observable
class CatsListViewModel {
    var service: CatsService
    var cats: [CatViewModel] = []
    
    private let pageSize = 50
    
    init(service: CatsService) {
        self.service = service
        self.loadCats()
    }
    
    var favoriteCats: [CatViewModel] {
        cats.filter {
            $0.favorite == true
        }
    }
    
    private func loadCats() {
        Task {
            // List
            var catsList: [CatEntryModel] = []
            do {
                catsList = try await service.loadCatsList(limit: pageSize, page: 0)
            } catch let error as NetworkError {
                print("ERROR LOADING CATS LIST: \(error.localizedDescription)")
            }

            let list = catsList
            
            await MainActor.run {
                cats = ConversionUtils.catsListConversion(models: list)
            }
        }
    }
}
