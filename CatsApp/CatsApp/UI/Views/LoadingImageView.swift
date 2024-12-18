//
//  LoadingImageView.swift
//  CatsApp
//
//  Created by Diogo Coelho on 17/12/2024.
//

import SwiftUI

enum LoadingImageShape {
    case rounded, rectangle
}

struct LoadingImageView: View {
    
    @Binding var imageWidth: CGFloat
    var imageUrl: String
    var clipShape: LoadingImageShape = .rectangle
    
    var body: some View {
        if let url = URL(string: imageUrl) {
            HStack {
                AsyncImage(url: url) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .aspectRatio(contentMode: .fit)
                .frame(width: imageWidth)
                .if(clipShape == .rounded) { view in
                    view.clipShape(
                        RoundedRectangle(
                            cornerSize: CGSize(
                                width: ImageMeasures.roundedImageCornerSize,
                                height: ImageMeasures.roundedImageCornerSize
                            )
                        )
                    )
                }
            }
        }
    }
}
