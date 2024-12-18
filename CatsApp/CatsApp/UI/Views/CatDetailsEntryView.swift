//
//  CatDetailsEntryView.swift
//  CatsApp
//
//  Created by Diogo Coelho on 18/12/2024.
//

import SwiftUI

struct CatDetailsEntryView: View {
    
    var title: String
    var value: String
    
    var body: some View {
        VStack(spacing: .zero) {
            HStack(spacing: .zero) {
                Text("\(title):")
                    .foregroundStyle(Color.highlightedText)
                Spacer()
            }
            HStack(spacing: .zero) {
                Text(value)
                Spacer()
            }
        }
    }
}
