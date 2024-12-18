//
//  CatsService.swift
//  CatsApp
//
//  Created by Diogo Coelho on 15/12/2024.
//

import Foundation
import Combine

protocol CatsService {
    func loadCatsList(limit: Int, page: Int) async throws -> [CatEntryModel]
}
