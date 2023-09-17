//
//  XkcdComicApi.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 17.9.23.
//

import Foundation

final class XkcdComicsApi {
    
    private let client: NetworkingClient
    
    init(client: NetworkingClient = .shared) {
        self.client = client
    }
}


extension XkcdComicsApi: XkcdComicsApiProtocol {
    func getCurrentComic() async throws -> XkcdComic {
        try await client.request(url: Endpoints.currentComic.url)
    }
    
    func getComic(_ num: Int) async throws -> XkcdComic {
        try await client.request(url: Endpoints.comic(num).url)
    }
}
