//
//  DataParser.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 17.9.23.
//

import Foundation

extension Data {
    func parse<T: Codable>() -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let parsed = try decoder.decode(T.self, from: self)
            return parsed
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
