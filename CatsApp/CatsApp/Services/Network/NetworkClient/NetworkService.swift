//
//  NetworkService.swift
//  CatsApp
//
//  Created by Diogo Coelho on 16/12/2024.
//

import Foundation
import Combine

class NetworkService {
    
    var session: URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 300
        return URLSession(configuration: configuration)
    }
    
    func request<T: Decodable>(endpoint: EndpointProvider, responseModel: T.Type) async throws -> T {
        do {
            let (data, response) = try await session.data(for: endpoint.request())
            return try self.manageResponse(data: data, response: response)
        } catch let error as NetworkError {
            throw error
        } catch {
            throw NetworkError(
                errorCode: "Generic Error",
                message: "Unknown API error \(error.localizedDescription)"
            )
        }
    }
    
    func manageResponse<T: Decodable>(data: Data, response: URLResponse) throws -> T {
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError(
                errorCode: "Network Error",
                message: "error.network.invalid".localized()
            )
        }
        switch response.statusCode {
        case 200...299:
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw NetworkError(
                    errorCode: "Decoding Error",
                    message: "Error while decoding JSON"
                )
            }
        default:
            guard let decodedError = try? JSONDecoder().decode(NetworkError.self, from: data) else {
                throw NetworkError(
                    statusCode: response.statusCode,
                    errorCode: "Decoding Error",
                    message: "Error while decoding JSON"
                )
            }
            throw NetworkError(
                statusCode: response.statusCode,
                errorCode: decodedError.errorCode,
                message: decodedError.message
            )
        }
    }
}
