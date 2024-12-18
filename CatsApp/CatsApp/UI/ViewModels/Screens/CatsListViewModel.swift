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
    private var pageNumber: Int {
        let floatResult = Float(cats.count) / Float(pageSize)
        return Int(ceil(floatResult))
    }
    
    var isLoading: Bool = false
    
    init(service: CatsService) {
        self.service = service
        self.loadCats()
    }
    
    var favoriteCats: [CatViewModel] {
        let favs = cats.filter {
            $0.favoriteId != nil
        }
        return favs
    }
    
    func catCellViewModel(cat: CatViewModel) -> CatCellViewModel {
        CatCellViewModel(service: service, cat: cat)
    }
    
    func loadMoreCats() {
        loadCats()
    }
    
    private func loadCats() {
        isLoading = true
        
        Task {
            // List
            var catsList: [CatEntryModel] = []
            do {
                catsList = try await service.loadCatsList(limit: pageSize, page: pageNumber)
            } catch let error as NetworkError {
                print("ERROR LOADING CATS LIST: \(error.localizedDescription)")
            }
            let staticCatsList = catsList
            
            // Favorites
            var favoritesList: [FavoriteEntryModel] = []
            do {
                favoritesList = try await service.loadFavoritesList()
            } catch let error as NetworkError {
                print("ERROR LOADING FAVORITES LIST: \(error.localizedDescription)")
            }
            let staticFavoritesList = favoritesList
            
            await MainActor.run {
                let convertedCats = ConversionUtils.catsListConversion(models: staticCatsList, favoritesList: staticFavoritesList)
                if !cats.isEmpty {
                    cats.append(contentsOf: convertedCats)
                } else {
                    cats = convertedCats
                }
                
                isLoading = false
            }
        }
    }
}
