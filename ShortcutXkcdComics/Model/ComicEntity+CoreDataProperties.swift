//
//  ComicEntity+CoreDataProperties.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 17.9.23.
//
//

import Foundation
import CoreData


extension ComicEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ComicEntity> {
        return NSFetchRequest<ComicEntity>(entityName: "ComicEntity")
    }

    @NSManaged public var id: Int64
    @NSManaged public var title: String
    @NSManaged public var dateStr: String
    @NSManaged public var img: String
    @NSManaged public var alt: String?
    @NSManaged public var news: String?
    @NSManaged public var transcript: String?
    @NSManaged public var imageData: Data
    @NSManaged public var addedAt: Date
}

extension ComicEntity : Identifiable {

}
