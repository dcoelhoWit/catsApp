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
    
    func loadFavouritesList() async throws -> [FavouriteEntryModel] {
        var response: [FavouriteEntryModel]
        let endpoint = Endpoints.getFavourites
        do {
            response = try await request(endpoint: endpoint, responseModel: [FavouriteEntryModel].self)
        } catch let error as NetworkError {
            throw error
        }
        
        return response
    }
    
    func addAsFavourite(imageId: String) async throws -> AddFavouriteResponseModel {
        var response: AddFavouriteResponseModel
        let endpoint = Endpoints.addFavourite(imageId: imageId)
        do {
            response = try await request(endpoint: endpoint, responseModel: AddFavouriteResponseModel.self)
        } catch let error as NetworkError {
            throw error
        }
        
        return response
    }
    
    func deleteFavourite(favId: String) async throws -> RemoveFavouriteResponseModel {
        var response: RemoveFavouriteResponseModel
        let endpoint = Endpoints.deleteFavourite(favId: favId)
        do {
            response = try await request(endpoint: endpoint, responseModel: RemoveFavouriteResponseModel.self)
        } catch let error as NetworkError {
            throw error
        }
        
        return response
    }
}
