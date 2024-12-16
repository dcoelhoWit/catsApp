//
//  CatsService.swift
//  CatsApp
//
//  Created by Diogo Coelho on 15/12/2024.
//

import Foundation
import Combine

protocol CatsService {
    func loadCatsList() async -> [CatEntryModel]
    func loadCatDetails(catId: String) async -> CatEntryDetailsModel
}
