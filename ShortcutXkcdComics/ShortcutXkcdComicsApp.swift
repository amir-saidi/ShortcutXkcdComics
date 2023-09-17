//
//  ShortcutXkcdComicsApp.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 17.9.23.
//

import SwiftUI

@main
struct ShortcutXkcdComicsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainTabView()
                //.environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
