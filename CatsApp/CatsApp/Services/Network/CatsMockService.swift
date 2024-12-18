//
//  CatsMockService.swift
//  CatsApp
//
//  Created by Diogo Coelho on 18/12/2024.
//

import SwiftUI

class CatsMockService: NetworkService, CatsService {
    
    private var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    func loadCatsList(limit: Int, page: Int) async throws -> [CatEntryModel] {
        let endpoint = Endpoints.catsList(limit: limit, page: page)
        if let mock = endpoint.mock {
            return loadJSON(filename: mock, type: [CatEntryModel].self)
        }
        return []
    }
    
    func loadFavoritesList() async throws -> [FavoriteEntryModel] {
        return []
    }
    
    func addAsFavorite(imageId: String) async throws -> AddFavoriteResponseModel {
        AddFavoriteResponseModel(id: 0, message: "")
    }
    
    func deleteFavorite(favId: String) async throws {
    }
    
    private func loadJSON<T: Decodable>(filename: String, type: T.Type) -> T {
        guard let path = bundle.url(forResource: filename, withExtension: "json") else {
            fatalError("!!! JSON loading error !!!!")
        }
        
        do {
            let data = try Data(contentsOf: path)
            let decodedObject = try JSONDecoder().decode(type, from: data)
            
            return decodedObject
        } catch {
            fatalError("!!! JSON decoding error !!!!")
        }
    }
}
