//
//  Persistence.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 17.9.23.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for index in 0..<10 {
            let newItem = ComicEntity(context: viewContext)
            let comic = Comic.preview
            newItem.id = Int64(comic.id + index)
            newItem.title = comic.title
            newItem.dateStr = comic.dateStr
            newItem.img = comic.img
            newItem.news = comic.news
            newItem.transcript = comic.transcript
            newItem.alt = comic.alt
            newItem.imageData = comic.image?.pngData() ?? Data()
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "ShortcutXkcdComics")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}


extension PersistenceController {
    static func previewItem() -> ComicEntity {
        let context = PersistenceController.preview.container.viewContext
        let newItem = ComicEntity(context: context)
        let comic = Comic.preview
        newItem.id = Int64(comic.id)
        newItem.title = comic.title
        newItem.dateStr = comic.dateStr
        newItem.img = comic.img
        newItem.news = comic.news
        newItem.transcript = comic.transcript
        newItem.alt = comic.alt
        newItem.imageData = comic.image?.pngData() ?? Data()
        return newItem
    }
}
