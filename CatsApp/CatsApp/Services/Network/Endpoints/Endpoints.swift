//
//  Endpoints.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import Foundation

enum Endpoints: EndpointProvider {
    case catsList
    case catDetails(id: String)

    var path: String {
        switch self {
        case .catsList:
            return ""
        case .catDetails(let id):
            return ""
        }
    }

    var method: RequestMethod {
        switch self {
        case .catsList:
            return .get
        case .catDetails:
            return .get
        }
    }

    var queryItems: [URLQueryItem]? {
        nil
    }

    var body: [String: Any]? {
        nil
    }

    var mock: String? {
        switch self {
        case .catsList:
            return "CatsListMock"
        case .catDetails:
            return "CatDetailsMock"
        }
    }
}
