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
    
    func request<T: Decodable>(endpoint: EndpointProvider, responseModel: T.Type) -> AnyPublisher<T, NetworkError> {
        do {
            return session
                .dataTaskPublisher(for: try endpoint.request())
                .tryMap { output in
                    return try self.manageResponse(data: output.data, response: output.response)
                }
                .mapError {
                    $0 as? NetworkError ?? NetworkError(errorCode: "error.network".localized(), message: "Unknown API error \($0.localizedDescription)")
                }
                .eraseToAnyPublisher()
        } catch let error as NetworkError {
            return AnyPublisher<T, NetworkError>(Fail(error: error))
        } catch {
            return AnyPublisher<T, NetworkError>(Fail(error: NetworkError(
                errorCode: "error.network".localized(),
                message: "\(error.localizedDescription)"
            )))
        }
    }
    
    func manageResponse<T: Decodable>(data: Data, response: URLResponse) throws -> T {
            guard let response = response as? HTTPURLResponse else {
                throw NetworkError(
                    errorCode: "error.network".localized(),
                    message: "error.network.invalid".localized()
                )
            }
            switch response.statusCode {
            case 200...299:
                do {
                    return try JSONDecoder().decode(T.self, from: data)
                } catch {
                    throw NetworkError(
                        errorCode: "decodingError",
                        message: "error.network.decoding".localized()
                    )
                }
            default:
                guard let decodedError = try? JSONDecoder().decode(NetworkError.self, from: data) else {
                    throw NetworkError(
                        statusCode: response.statusCode,
                        errorCode: "error.network".localized(),
                        message: "error.network.backend".localized()
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
