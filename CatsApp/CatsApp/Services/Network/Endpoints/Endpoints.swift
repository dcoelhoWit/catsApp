//
//  Endpoints.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import Foundation

enum Endpoints: EndpointProvider {
    case catsList(limit: Int, page: Int)
    case catImages(catsIds: [String])

    var path: String {
        switch self {
        case .catsList:
            return "/v1/breeds"
        case .catImages:
            return "/v1/images/search"
        }
    }

    var method: RequestMethod {
        switch self {
        case .catsList:
            return .get
        case .catImages:
            return .get
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .catsList(let limit, let page):
            return [URLQueryItem(name: "limit", value: "\(limit)"), URLQueryItem(name: "page", value: "\(page)")]
        case .catImages(let catsIds):
            var catsIdsString = catsIds.joined(separator: ",")
            if catsIdsString.isEmpty {
                return [URLQueryItem(name: "limit", value: "100"), URLQueryItem(name: "api_key", value: "live_xKuieF7JqeeFQO1VPN5zvYwx3STQJJ6lDfUF7B8yOM1FVs9dyV32ZYKoyqR2iF5S")]
            }
            catsIdsString.removeLast()
            return [URLQueryItem(name: "limit", value: "100"), URLQueryItem(name: "breed_ids", value: catsIdsString), URLQueryItem(name: "api_key", value: "live_xKuieF7JqeeFQO1VPN5zvYwx3STQJJ6lDfUF7B8yOM1FVs9dyV32ZYKoyqR2iF5S")]
        }
    }

    var body: [String: Any]? {
        nil
    }

    var mock: String? {
        switch self {
        case .catsList:
            return "CatsListMock"
        case .catImages:
            return "CatImagesMock"
        }
    }
}
