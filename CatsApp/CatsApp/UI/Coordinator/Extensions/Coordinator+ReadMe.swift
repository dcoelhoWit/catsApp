//
//  Coordinator+ReadMe.swift
//  CatsApp
//
//  Created by Diogo Coelho on 15/12/2024.
//

import SwiftUI

extension Coordinator {
    
    @ViewBuilder
    func buildReadMeView() -> some View {
        let viewModel = buildReadMeViewModel()
        ReadMeView(viewModel: viewModel)
    }
    
    private func buildReadMeViewModel() -> ReadMeViewModel {
        let viewModel = ReadMeViewModel(
            title: "title.about".localized(),
            description: "description.about".localized()
        )
        return viewModel
    }
}
