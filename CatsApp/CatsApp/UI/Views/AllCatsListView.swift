//
//  AllCatsListView.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import SwiftUI

struct AllCatsListView: View {
    
    @Environment(Coordinator.self) private var coordinator
    
    @State var viewModel: CatsListViewModel
    @State(initialValue: false) private var offlineMode
    
    @State private var searchText = ""
    var searchResults: [CatViewModel] {
        if searchText.isEmpty {
            return viewModel.cats
        } else {
            return viewModel.cats.filter { $0.breed.contains(searchText) }
        }
    }
    
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
                Text("title.all.cats".localized())
                    .foregroundStyle(Color.highlightedText)
                    .font(.title2)
                    .accessibilityIdentifier("allCatsTitle")
                Spacer()
                Spacer()
                    .frame(width: IconMeasures.readMeIconSize, height: IconMeasures.readMeIconSize)
            }
            Spacer()
                .frame(height: SpacingMeasures.smallSpacer)
            // Online / Offline Mode
            HStack(spacing: .zero) {
                Spacer()
                    .frame(width: SpacingMeasures.smallSpacer)
                Toggle("offline.mode".localized(), isOn: $offlineMode)
                    .toggleStyle(SwitchToggleStyle(tint: Color.toggleOn))
                    .frame(height: SizingMeasures.offlineModeButtonHeight)
                Spacer()
                    .frame(width: SpacingMeasures.smallSpacer)
            }
            // Search Bar
            HStack {
                Spacer()
                    .frame(width: SpacingMeasures.regularSpacer)
                
                TextField("search.hint", text: $searchText)
                    .foregroundColor(Color.buttonTxt)
                    .padding()
                    .background(Color.searchBg)
                    .cornerRadius(CornerRadiusMeasures.search.width)
                
                Spacer()
                    .frame(width: SpacingMeasures.regularSpacer)
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
                            ForEach(Array(searchResults.enumerated()), id: \.1.catId) { index, cat in
                                if index == 0 {
                                    CatCell(viewModel: viewModel.catCellViewModel(cat: cat))
                                        .accessibilityIdentifier("firstCat")
                                } else {
                                    CatCell(viewModel: viewModel.catCellViewModel(cat: cat))
                                }
                            }
                        }
                        Button(action: {
                            if !viewModel.isLoading {
                                viewModel.loadCats()
                            }
                        }) {
                            ZStack {
                                RoundedRectangle(cornerSize: CornerRadiusMeasures.standard)
                                    .foregroundStyle(Color.buttonBg)
                                Text("button.load.more".localized())
                                    .foregroundStyle(Color.buttonTxt)
                                    .opacity(viewModel.isLoading ? 0.0 : 1.0)
                                    .padding()
                            }
                        }
                        .overlay {
                            ProgressView()
                                .tint(.spinnerTint)
                                .opacity(viewModel.isLoading ? 1.0 : 0.0)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                        .frame(width: SpacingMeasures.smallSpacer)
                }
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
        .onChange(of: offlineMode) {
            viewModel.offlineMode = offlineMode
            viewModel.cats = []
            viewModel.loadCats()
        }
    }
    
    var gridColumns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: SpacingMeasures.smallSpacer), count: 2)
    }
}
