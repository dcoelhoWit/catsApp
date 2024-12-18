//
//  CatsNetworkService.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import SwiftUI

class CatsNetworkService: NetworkService, CatsService {
    
    func loadCatsList(limit: Int, page: Int) async throws -> [CatEntryModel] {
        var response: [CatEntryModel]
        let endpoint = Endpoints.catsList(limit: limit, page: page)
        do {
            response = try await request(endpoint: endpoint, responseModel: [CatEntryModel].self)
        } catch let error as NetworkError {
            throw error
        }
        
        return response
    }
}
