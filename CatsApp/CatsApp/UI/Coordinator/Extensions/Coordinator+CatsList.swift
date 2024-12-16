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
        let viewModel = CatsListViewModel(cats: [])
        return viewModel
    }
}
