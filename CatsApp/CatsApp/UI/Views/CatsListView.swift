//
//  CatsListView.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import SwiftUI

struct CatsListView: View {
    
    @Environment(Coordinator.self) private var coordinator
    
    @State var viewModel: CatsListViewModel
    
    var body: some View {
        TabView {
            AllCatsListView(viewModel: viewModel)
                .tabItem {
                    Label("All", systemImage: "pawprint.fill")
                }
            
            FavoriteCatsListView(viewModel: viewModel)
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .background(Color.background)
    }
}
