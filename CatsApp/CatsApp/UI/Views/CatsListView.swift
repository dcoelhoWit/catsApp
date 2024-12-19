//
//  CatsListView.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import SwiftUI

struct CatsListView: View {
    
    @State var viewModel: CatsListViewModel
    
    var body: some View {
        TabView {
            AllCatsListView(viewModel: viewModel)
                .tabItem {
                    Label("tab.all", systemImage: "pawprint.fill")
                }
            
            FavouriteCatsListView(viewModel: viewModel)
                .tabItem {
                    Label("tab.favs", systemImage: "star.fill")
                }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .background(Color.background)
    }
}
