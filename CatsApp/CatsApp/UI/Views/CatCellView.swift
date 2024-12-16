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
                Image(systemName: "star")
            }
            Image(systemName: "face.dashed")
            Text("Cat")
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 8.0, height: 8.0)))
    }
}
