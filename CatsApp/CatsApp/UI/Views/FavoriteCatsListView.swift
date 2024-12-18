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
            Text("title.favorite.cats".localized())
            
            Spacer()
                .frame(height: SpacingMeasures.regularSpacer)
            
            HStack(spacing: .zero) {
                Spacer()
                    .frame(width: SpacingMeasures.smallSpacer)
                
                ScrollView(.vertical) {
                    LazyVGrid(columns: gridColumns, spacing: SpacingMeasures.smallSpacer) {
                        ForEach(viewModel.favoriteCats, id: \.catId) { cat in
                            CatCell(viewModel: cat, service: viewModel.service)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                
                Spacer()
                    .frame(width: SpacingMeasures.smallSpacer)
            }
            
            Spacer()
        }
        .frame(maxHeight: .infinity)
        .background(Color.background)
    }
    
    var gridColumns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: SpacingMeasures.smallSpacer), count: 2)
    }
}
