//
//  FullScreenCover.swift
//  CatsApp
//
//  Created by Diogo Coelho on 15/12/2024.
//

import Foundation

enum FullScreenCover: Identifiable, Hashable {
    case readMe
    
    var id: String {
        switch self {
        case .readMe:
            "readMe"
        }
    }
}
