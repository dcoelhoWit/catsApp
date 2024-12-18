//
//  CatCellView.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import SwiftUI

struct CatCell: View {
    
    @Environment(Coordinator.self) private var coordinator
    
    @State var viewModel: CatCellViewModel
    @State(initialValue: ImageMeasures.thumbnailSize) var imageWidth
    
    var body: some View {
        VStack(spacing: .zero) {
            Spacer()
            
            HStack(spacing: .zero) {
                Spacer()
                
                VStack() {
                    LoadingImageView(
                        imageWidth: $imageWidth,
                        imageUrl: viewModel.cat.imageUrl,
                        clipShape: .rounded
                    )
                    Text(viewModel.cat.breed)
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .background(Color.entryBackground)
        .clipShape(RoundedRectangle(cornerSize: CornerRadiusMeasures.standard))
        .overlay {
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: viewModel.cat.favoriteId != nil ? "star.fill" : "star")
                }
                Spacer()
            }
            .onTapGesture {
                viewModel.cat.setFavorite(service: viewModel.service, imageId: viewModel.cat.imageId, favId: viewModel.cat.favoriteId)
            }
        }
        .onTapGesture {
            coordinator.push(.catDetails(viewModel.cat))
        }
    }
}
