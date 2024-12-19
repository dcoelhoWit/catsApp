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
    var offlineMode: Bool = false
    
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
    
    var favouriteCats: [CatViewModel] {
        let favs = cats.filter {
            $0.favouriteId != nil
        }
        return favs
    }
    
    func catCellViewModel(cat: CatViewModel) -> CatCellViewModel {
        CatCellViewModel(service: service, cat: cat)
    }
    
    func loadCats() {
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
            
            // Favourites
            var favouritesList: [FavouriteEntryModel] = []
            do {
                favouritesList = try await service.loadFavouritesList()
            } catch let error as NetworkError {
                print("ERROR LOADING FavouriteS LIST: \(error.localizedDescription)")
            }
            let staticFavouritesList = favouritesList
            
            await MainActor.run {
                let convertedCats = ConversionUtils.catsListConversion(models: staticCatsList, favouritesList: staticFavouritesList)
                if !cats.isEmpty && !offlineMode {
                    cats.append(contentsOf: convertedCats)
                } else {
                    cats = convertedCats
                }
                
                isLoading = false
            }
        }
    }
}
