//
//  ComicsPersistenceManager.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 17.9.23.
//

import SwiftUI
import CoreData

class ComicsPersistenceManager: ComicPersistenceProtocol {
    
    private var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    // MARK: - Methods
    
    func save(_ comic: Comic) {
        let newItem = ComicEntity(context: context)
        newItem.id = Int64(comic.id)
        newItem.title = comic.title
        newItem.dateStr = comic.dateStr
        newItem.img = comic.img
        newItem.news = comic.news
        newItem.transcript = comic.transcript
        newItem.alt = comic.alt
        newItem.imageData = comic.image?.pngData() ?? Data()
        newItem.addedAt = Date()
        save()
    }
    
    func loadComics() -> [ComicEntity] {
        let fetchRequest = ComicEntity.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "addedAt", ascending: false)]
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func comic(_ num: Int) -> Comic? {
        guard let local = fetch(num) else { return nil }
        
        return Comic(id: Int(local.id), title: local.title, dateStr: local.dateStr, img: local.img, news: local.news, transcript: local.transcript, alt: local.alt, image: UIImage(data: local.imageData))
    }
    
    func delete(_ num: Int) {
        guard let comic = fetch(num) else { return }
        context.delete(comic)
        save()
    }
    
    func delete(_ comic: ComicEntity) {
        context.delete(comic)
        save()
    }
    
    func save() {
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
}

private extension ComicsPersistenceManager {
    func fetch(_ num: Int) -> ComicEntity? {
        let fetchRequest = ComicEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", num)
        return try? context.fetch(fetchRequest).first
    }
}

