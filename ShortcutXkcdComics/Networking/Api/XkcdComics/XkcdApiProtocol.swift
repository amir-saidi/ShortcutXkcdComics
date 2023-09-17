//
//  XkcdApiProtocol.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 17.9.23.
//

import Foundation

protocol XkcdComicsApiProtocol {
    func getCurrentComic() async throws -> XkcdComic
    func getComic(_ num: Int) async throws -> XkcdComic
}
