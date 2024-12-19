//
//  FavouriteCatsListView.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import SwiftUI

struct FavouriteCatsListView: View {
    
    @Environment(Coordinator.self) private var coordinator
    
    @State var viewModel: CatsListViewModel
    
    var body: some View {
        VStack(spacing: CGFloat.zero) {
            // Header
            HStack(spacing: CGFloat.zero) {
                Spacer()
                    .frame(width: SpacingMeasures.regularSpacer)
                Button("☘︎") {
                    coordinator.present(fullScreenCover: .readMe)
                }
                .font(.system(size: IconMeasures.readMeIconSize))
                .foregroundStyle(Color.icon)
                .accessibilityIdentifier("readMeButton")
                .frame(width: IconMeasures.readMeIconSize, height: IconMeasures.readMeIconSize)
                
                Spacer()
                Text("title.favourite.cats".localized())
                    .foregroundStyle(Color.highlightedText)
                    .font(.title2)
                    .accessibilityIdentifier("allCatsTitle")
                Spacer()
                Spacer()
                    .frame(width: IconMeasures.readMeIconSize, height: IconMeasures.readMeIconSize)
            }
            // Content
            VStack(spacing: CGFloat.zero) {
                Spacer()
                    .frame(height: SpacingMeasures.regularSpacer)
                
                HStack(spacing: .zero) {
                    Spacer()
                        .frame(width: SpacingMeasures.smallSpacer)
                    
                    ScrollView(.vertical) {
                        LazyVGrid(columns: gridColumns, spacing: SpacingMeasures.smallSpacer) {
                            ForEach(viewModel.favouriteCats, id: \.catId) { cat in
                                CatCell(viewModel: viewModel.catCellViewModel(cat: cat))
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                        .frame(width: SpacingMeasures.smallSpacer)
                }
                
                Spacer()
            }
        }
        .frame(maxHeight: .infinity)
        .background(Color.background)
    }
    
    var gridColumns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: SpacingMeasures.smallSpacer), count: 2)
    }
}
