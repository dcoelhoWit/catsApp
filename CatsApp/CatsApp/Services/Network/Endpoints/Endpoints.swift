//
//  Endpoints.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import Foundation

enum Endpoints: EndpointProvider {
    case catsList(limit: Int, page: Int)
    case addFavorite(imageId: String)
    case deleteFavorite(favId: String)
    case getFavorites
    
    var path: String {
        switch self {
        case .catsList:
            return "/v1/breeds"
        case .addFavorite:
            return "/v1/favourites"
        case .deleteFavorite(let favId):
            if favId.isEmpty {
                return "/v1/favourites"
            }
            return "/v1/favourites/\(favId)"
        case .getFavorites:
            return "/v1/favourites"
        }
    }

    var method: RequestMethod {
        switch self {
        case .catsList:
            return .get
        case .addFavorite:
            return .post
        case .deleteFavorite:
            return .delete
        case .getFavorites:
            return .get
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .catsList(let limit, let page):
            return [URLQueryItem(name: "limit", value: "\(limit)"), URLQueryItem(name: "page", value: "\(page)")]
        case .addFavorite:
            return [URLQueryItem(name: "api_key", value: "live_xKuieF7JqeeFQO1VPN5zvYwx3STQJJ6lDfUF7B8yOM1FVs9dyV32ZYKoyqR2iF5S")]
        case .deleteFavorite:
            return nil
        case .getFavorites:
            return [URLQueryItem(name: "api_key", value: "live_xKuieF7JqeeFQO1VPN5zvYwx3STQJJ6lDfUF7B8yOM1FVs9dyV32ZYKoyqR2iF5S")]
        }
    }

    var body: [String: Any]? {
        switch self {
        case .catsList:
            return nil
        case .addFavorite(let imageId):
            return ["image_id": imageId]
        case .deleteFavorite:
            return nil
        case .getFavorites:
            return nil
        }
    }

    var mock: String? {
        switch self {
        case .catsList:
            return "CatsListMock"
        case .addFavorite:
            return nil
        case .deleteFavorite:
            return nil
        case .getFavorites:
            return "FavoritesMock"
        }
    }
}
