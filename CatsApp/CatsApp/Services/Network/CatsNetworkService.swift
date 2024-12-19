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
    
    func addAsFavorite(imageId: String) async throws -> AddFavoriteResponseModel {
        var response: AddFavoriteResponseModel
        let endpoint = Endpoints.addFavorite(imageId: imageId)
        do {
            response = try await request(endpoint: endpoint, responseModel: AddFavoriteResponseModel.self)
        } catch let error as NetworkError {
            throw error
        }
        
        return response
    }
    
    func deleteFavorite(favId: String) async throws -> RemoveFavoriteResponseModel {
        var response: RemoveFavoriteResponseModel
        let endpoint = Endpoints.deleteFavorite(favId: favId)
        do {
            response = try await request(endpoint: endpoint, responseModel: RemoveFavoriteResponseModel.self)
        } catch let error as NetworkError {
            throw error
        }
        
        return response
    }
}
