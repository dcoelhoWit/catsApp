//
//  FavoriteCatsListView.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import SwiftUI

struct FavoriteCatsListView: View {
    
    @Environment(Coordinator.self) private var coordinator
    
    @State var viewModel: CatsListViewModel
    
    var body: some View {
        VStack(spacing: CGFloat.zero) {
            Text("Favorite Cats")
            
            Spacer()
                .frame(height: SpacingMeasures.regularSpacer.rawValue)
            
            LazyVGrid(columns: gridColumns, spacing: SpacingMeasures.smallSpacer.rawValue) {
                CatCell(viewModel: CatEntryViewModel())
                CatCell(viewModel: CatEntryViewModel())
            }
            
            Spacer()
        }
        .frame(maxHeight: .infinity)
        .background(Color.background)
    }
    
    var gridColumns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: SpacingMeasures.smallSpacer.rawValue), count: 2)
    }
}
