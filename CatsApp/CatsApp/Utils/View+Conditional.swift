//
//  View+Conditional.swift
//  CatsApp
//
//  Created by Diogo Coelho on 17/12/2024.
//

import SwiftUI

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
