//
//  Coordinator+CatDetails.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import SwiftUI

extension Coordinator {
    
    @ViewBuilder
    func buildCatDetailsView(cat: CatViewModel) -> some View {
        let viewModel = buildCatDetailsViewModel(cat: cat)
        CatDetailsView(viewModel: viewModel)
    }
    
    private func buildCatDetailsViewModel(cat: CatViewModel) -> CatDetailsViewModel {
        let service = serviceFactory.catsService()
        let viewModel = CatDetailsViewModel(service: service, cat: cat)
        return viewModel
    }
}
