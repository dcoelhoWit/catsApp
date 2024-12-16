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
    
    var body: some View {
        VStack(spacing: CGFloat.zero) {
            Text("title.all.cats".localized())
            
            Spacer()
                .frame(height: SpacingMeasures.regularSpacer.rawValue)
            
            HStack(spacing: .zero) {
                Spacer()
                    .frame(width: SpacingMeasures.smallSpacer.rawValue)
                
                ScrollView(.vertical) {
                    LazyVGrid(columns: gridColumns, spacing: SpacingMeasures.smallSpacer.rawValue) {
                        ForEach(viewModel.cats, id: \.catId) { cat in
                            CatCell(viewModel: cat)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                
                Spacer()
                    .frame(width: SpacingMeasures.smallSpacer.rawValue)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
    
    var gridColumns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: SpacingMeasures.smallSpacer.rawValue), count: 2)
    }
}
