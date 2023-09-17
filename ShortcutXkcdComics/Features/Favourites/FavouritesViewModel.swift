//
//  FavouritesViewModel.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 17.9.23.
//

import SwiftUI

class FavouritesViewModel: ObservableObject {
    
    @Published var comics = [ComicEntity]()
    
    private var comicService: ComicPersistenceProtocol
    
    init(comicService: ComicPersistenceProtocol = ComicsPersistenceManager(context: PersistenceController.shared.container.viewContext)) {
        self.comicService = comicService
    }
    
    func loadComic() {
        comics = comicService.loadComics()
    }
    
    func delete(_ indesSet: IndexSet) {
        guard let index = indesSet.first else { return }
        let comic = comics[index]
        comicService.delete(comic)
        loadComic()
    }
    
    func details(_ selected: ComicEntity) -> Comic {
        return Comic(id: Int(selected.id), title: selected.title, dateStr: selected.dateStr, img: selected.img, news: selected.news ?? "", transcript: selected.transcript ?? "", alt: selected.alt ?? "", image: UIImage(data: selected.imageData))
    }
}
