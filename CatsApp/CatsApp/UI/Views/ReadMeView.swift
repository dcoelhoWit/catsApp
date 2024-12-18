//
//  ReadMeView.swift
//  CatsApp
//
//  Created by Diogo Coelho on 15/12/2024.
//

import SwiftUI

struct ReadMeView: View {
    
    @Environment(Coordinator.self) private var coordinator
    
    @State var viewModel: ReadMeViewModel
    
    var body: some View {
        VStack(spacing: CGFloat.zero) {
            ZStack {
                HStack(spacing: CGFloat.zero) {
                    Spacer()
                        .frame(width: SpacingMeasures.regularSpacer)
                    Button("✘") {
                        coordinator.dismissFullScreenCover()
                    }
                    .font(.system(size: IconMeasures.dismissIconSize))
                    .foregroundStyle(.icon)
                    Spacer()
                }
                HStack(spacing: CGFloat.zero) {
                    Spacer()
                    Text(viewModel.title)
                        .foregroundStyle(.highlightedText)
                        .font(.title2)
                        .accessibilityIdentifier("readMeTitle")
                    Spacer()
                }
            }
            Spacer()
            HStack(spacing: CGFloat.zero) {
                Spacer()
                    .frame(width: SpacingMeasures.regularSpacer)
                ScrollView {
                    VStack {
                        Spacer()
                            .frame(height: SpacingMeasures.regularSpacer)
                        Text(viewModel.description)
                            .foregroundStyle(.highlightedText)
                    }
                }
                Spacer()
                    .frame(width: SpacingMeasures.regularSpacer)
            }
            Spacer()
        }
        .background(Color.background)
    }
}
