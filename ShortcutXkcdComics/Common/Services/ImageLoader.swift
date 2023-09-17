//
//  ImageLoader.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 17.9.23.
//

import SwiftUI

struct ImageLoader {
    
    static func loadImage(url: URL?) async throws -> UIImage {
        guard let url = url else { throw NetworkError.badURL }
        
        if let cached = ImageCache.getImage(for: url) {
            return cached
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        guard let image = UIImage(data: data) else { throw NetworkError.badResponse }
        ImageCache.setImage(image, for: url)
        return image
    }
}

fileprivate class ImageCache {
    static private var cache = [URL: UIImage]()
    
    static func setImage(_ image: UIImage?, for url: URL) {
        cache[url] = image
    }
    
    static func getImage(for url: URL) -> UIImage? {
        return cache[url]
    }
}
