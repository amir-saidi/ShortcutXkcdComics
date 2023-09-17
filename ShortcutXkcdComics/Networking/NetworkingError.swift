//
//  NetworkingError.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 17.9.23.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badResponse
    case noData
    case parsing
    case error400
    case serverError
    case general(String)
    
    var message: String {
        switch self {
        case .badURL:
            return "URL for this request is not valid."
        case .badResponse:
            return "Response received is not proper"
        case .noData:
            return "Missing data"
        case .parsing:
            return "Response can not be parsed."
        case .error400:
            return "Not found"
        case .serverError:
            return "Server Error"
        case .general(let string):
            return string
        }
    }
}
