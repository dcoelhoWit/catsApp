//
//  Page.swift
//  CatsApp
//
//  Created by Diogo Coelho on 15/12/2024.
//

import Foundation

enum Page: Identifiable, Hashable {
    case catsList, catDetails(CatViewModel)
    
    var id: String {
        switch self {
        case .catsList:
            "catsList"
        case .catDetails:
            "catDetails"
        }
    }
}
