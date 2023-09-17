//
//  NetworkingService.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 17.9.23.
//

import Foundation

class NetworkingClient {
    
    static let shared = NetworkingClient()
    
    func request<T: Codable>(url: URL?) async throws -> T {
        guard let url = url else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let serverResponse = response as? HTTPURLResponse else {
            throw NetworkError.badResponse
        }
        
        switch serverResponse.statusCode {
        case 200 ..< 300:
            guard let parsed: T = data.parse() else {
                throw NetworkError.parsing
            }
            
            return parsed
        case 400 ..< 500:
            throw NetworkError.error400
        default:
            throw NetworkError.serverError
        }
    }
}
