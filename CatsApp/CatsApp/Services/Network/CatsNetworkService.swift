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
    
    func loadFavoritesList() async throws -> [FavoriteEntryModel] {
        var response: [FavoriteEntryModel]
        let endpoint = Endpoints.getFavorites
        do {
            response = try await request(endpoint: endpoint, responseModel: [FavoriteEntryModel].self)
        } catch let error as NetworkError {
            throw error
        }
        
        return response
    }
    
    func addAsFavorite(imageId: String) async throws {
        let endpoint = Endpoints.addFavorite(imageId: imageId)
        do {
            let _ = try await noReturnRequest(endpoint: endpoint)
        } catch let error as NetworkError {
            throw error
        }
    }
    
    func deleteFavorite(favId: String) async throws {
        let endpoint = Endpoints.deleteFavorite(favId: favId)
        do {
            let _ = try await noReturnRequest(endpoint: endpoint)
        } catch let error as NetworkError {
            throw error
        }
    }
}
