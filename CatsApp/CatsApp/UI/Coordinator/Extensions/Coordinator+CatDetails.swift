//
//  Coordinator+CatDetails.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import SwiftUI

extension Coordinator {
    
    @ViewBuilder
    func buildCatDetailsView(catId: String) -> some View {
        let viewModel = buildCatDetailsViewModel(catId: catId)
        CatDetailsView(viewModel: viewModel)
    }
    
    private func buildCatDetailsViewModel(catId: String) -> CatDetailsViewModel {
        let viewModel = CatDetailsViewModel(details: CatEntryDetailsModel())
        return viewModel
    }
}
