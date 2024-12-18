//
//  CatCellView.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import SwiftUI

struct CatCell: View {
    
    @Environment(Coordinator.self) private var coordinator
    
    @State var viewModel: CatViewModel
    @State(initialValue: ImageMeasures.thumbnailSize) var imageWidth
    var service: CatsService
    
    var body: some View {
        VStack(spacing: .zero) {
            Spacer()
            
            HStack(spacing: .zero) {
                Spacer()
                
                VStack() {
                    LoadingImageView(
                        imageWidth: $imageWidth,
                        imageUrl: viewModel.imageUrl,
                        clipShape: .rounded
                    )
                    Text(viewModel.breed)
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
                    Image(systemName: viewModel.favoriteId != nil ? "star.fill" : "star")
                }
                Spacer()
            }
            .onTapGesture {
                viewModel.setFavorite(service: service, imageId: viewModel.imageId, favId: viewModel.favoriteId)
            }
        }
        .onTapGesture {
            coordinator.push(.catDetails(viewModel))
        }
    }
}
