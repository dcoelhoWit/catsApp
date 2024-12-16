//
//  Coordinator+CatsList.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import SwiftUI

extension Coordinator {
    
    @ViewBuilder
    func buildCatsListView() -> some View {
        let viewModel = buildCatsListViewModel()
        CatsListView(viewModel: viewModel)
    }
    
    private func buildCatsListViewModel() -> CatsListViewModel {
        
        let cat01 = CatEntryViewModel(
            catId: "cat01",
            breed: "Breed 1",
            favorite: false
        )
        
        let cat02 = CatEntryViewModel(
            catId: "cat02",
            breed: "Breed 2",
            favorite: true
        )
        
        let cat03 = CatEntryViewModel(
            catId: "cat03",
            breed: "Breed 3",
            favorite: false
        )
        
        let viewModel = CatsListViewModel(cats: [cat01, cat02, cat03])
        return viewModel
    }
}
