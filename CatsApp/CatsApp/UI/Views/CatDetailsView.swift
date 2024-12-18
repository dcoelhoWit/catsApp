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
    @State(initialValue: ImageMeasures.detailsImageSize) var imageWidth
    
    var body: some View {
        VStack(spacing: CGFloat.zero) {
            // Header
            HStack(spacing: CGFloat.zero) {
                Spacer()
                    .frame(width: SpacingMeasures.regularSpacer)
                Button("◀︎") {
                    coordinator.pop()
                }
                .font(.system(size: IconMeasures.dismissIconSize))
                .foregroundStyle(Color.icon)
                .frame(width: IconMeasures.dismissIconSize, height: IconMeasures.dismissIconSize)
                Spacer()
                Text(viewModel.cat.breed)
                    .foregroundStyle(Color.highlightedText)
                    .font(.title2)
                    .accessibilityIdentifier("allCatsTitle")
                Spacer()
                Button(viewModel.cat.favorite ? "★" : "☆") {
                    // TODO: mark as favorite logic
                }
                .font(.system(size: IconMeasures.favIconSize))
                .foregroundStyle(Color.icon)
                .frame(width: IconMeasures.favIconSize, height: IconMeasures.favIconSize)
                Spacer()
                    .frame(width: SpacingMeasures.regularSpacer)
            }
            // Content
            ScrollView(.vertical) {
                HStack(spacing: .zero) {
                    Spacer()
                        .frame(width: SpacingMeasures.regularSpacer)
                    
                    VStack(spacing: SpacingMeasures.smallSpacer) {
                        Spacer()
                            .frame(height: SpacingMeasures.regularSpacer)
                        
                        HStack {
                            Spacer()
                            
                            LoadingImageView(
                                imageWidth: $imageWidth,
                                imageUrl: viewModel.cat.imageUrl,
                                clipShape: .rounded
                            )
                            
                            Spacer()
                        }
                        
                        Spacer()
                            .frame(height: SpacingMeasures.smallSpacer)
                        
                        CatDetailsEntryView(title: "cat.details.breed".localized(), value: viewModel.cat.breed)
                            .accessibilityIdentifier("catDetailsBreed")
                        CatDetailsEntryView(title: "cat.details.origin".localized(), value: viewModel.cat.origin)
                        CatDetailsEntryView(title: "cat.details.temperament".localized(), value: viewModel.cat.temperament)
                        CatDetailsEntryView(title: "cat.details.description".localized(), value: viewModel.cat.description)
                    }
                    
                    Spacer()
                        .frame(width: SpacingMeasures.regularSpacer)
                }
            }
        }
        .background(Color.background)
        .navigationBarBackButtonHidden(true)
    }
}
