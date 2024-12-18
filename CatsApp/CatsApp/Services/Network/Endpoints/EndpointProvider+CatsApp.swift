//
//  EndpointProvider+CatsApp.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import Foundation

extension EndpointProvider {

    var scheme: String {
        return "https"
    }

    var baseURL: String {
        return "api.thecatapi.com"
    }

    func request() throws -> URLRequest {

        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host =  baseURL
        urlComponents.path = path
        if let queryItems = queryItems {
            urlComponents.queryItems = queryItems
        }
        guard let url = urlComponents.url else {
            throw NetworkError(errorCode: "error.network".localized(), message: "URL error")
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("true", forHTTPHeaderField: "X-Use-Cache")
        urlRequest.addValue("x-api-key", forHTTPHeaderField: "live_xKuieF7JqeeFQO1VPN5zvYwx3STQJJ6lDfUF7B8yOM1FVs9dyV32ZYKoyqR2iF5S")

        if let body = body {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
            } catch {
                throw NetworkError(errorCode: "error.network".localized(), message: "Error encoding http body")
            }
        }
        return urlRequest
    }
}
