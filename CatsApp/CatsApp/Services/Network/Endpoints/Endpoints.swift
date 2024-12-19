//
//  Endpoints.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import Foundation

enum Endpoints: EndpointProvider {
    case catsList(limit: Int, page: Int)
    case addFavourite(imageId: String)
    case deleteFavourite(favId: String)
    case getFavourites
    
    var path: String {
        switch self {
        case .catsList:
            return "/v1/breeds"
        case .addFavourite:
            return "/v1/favourites"
        case .deleteFavourite(let favId):
            if favId.isEmpty {
                return "/v1/favourites"
            }
            return "/v1/favourites/\(favId)"
        case .getFavourites:
            return "/v1/favourites"
        }
    }

    var method: RequestMethod {
        switch self {
        case .catsList:
            return .get
        case .addFavourite:
            return .post
        case .deleteFavourite:
            return .delete
        case .getFavourites:
            return .get
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .catsList(let limit, let page):
            return [URLQueryItem(name: "limit", value: "\(limit)"), URLQueryItem(name: "page", value: "\(page)")]
        case .addFavourite:
            return [URLQueryItem(name: "api_key", value: "live_xKuieF7JqeeFQO1VPN5zvYwx3STQJJ6lDfUF7B8yOM1FVs9dyV32ZYKoyqR2iF5S")]
        case .deleteFavourite:
            return nil
        case .getFavourites:
            return [URLQueryItem(name: "api_key", value: "live_xKuieF7JqeeFQO1VPN5zvYwx3STQJJ6lDfUF7B8yOM1FVs9dyV32ZYKoyqR2iF5S")]
        }
    }

    var body: [String: Any]? {
        switch self {
        case .catsList:
            return nil
        case .addFavourite(let imageId):
            return ["image_id": imageId]
        case .deleteFavourite:
            return nil
        case .getFavourites:
            return nil
        }
    }

    var mock: String? {
        switch self {
        case .catsList:
            return "CatsListMock"
        case .addFavourite:
            return "AddFavouriteMock"
        case .deleteFavourite:
            return "DeleteFavouriteMock"
        case .getFavourites:
            return "FavouritesMock"
        }
    }
}
