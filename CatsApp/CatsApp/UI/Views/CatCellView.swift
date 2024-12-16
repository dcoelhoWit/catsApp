//
//  CatCellView.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import SwiftUI

struct CatCell: View {
    
    @State var viewModel: CatEntryViewModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: viewModel.favorite ? "star.fill" : "star")
            }
            Image(systemName: "face.dashed")
            Text(viewModel.breed)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerSize: roundCornersStandardSize))
    }
}
