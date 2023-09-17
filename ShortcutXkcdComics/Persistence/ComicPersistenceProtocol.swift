//
//  ComicPersistenceProtocol.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 17.9.23.
//

import Foundation

protocol ComicPersistenceProtocol {
    func save(_ comic: Comic)
    func loadComics() -> [ComicEntity]
    func comic(_ num: Int) -> Comic?
    func delete(_ num: Int)
    func delete(_ comic: ComicEntity)
    func save()
}
