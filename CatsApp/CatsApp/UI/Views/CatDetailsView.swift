//
//  CatDetailsView.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import SwiftUI

struct CatDetailsView: View {
    
    @Environment(Coordinator.self) private var coordinator
    
    @State var viewModel: CatDetailsViewModel
    
    var body: some View {
        VStack(spacing: CGFloat.zero) {
           Text("Cats Details View")
        }
        .background(Color.background)
    }
}
