//
//  ComicsViewModel.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 17.9.23.
//

import SwiftUI

import SwiftUI
import CoreData

class ComicsViewModel: ObservableObject {
    
    @Published private(set) var comic: Comic?
    private var currentComicNum: Int?
    
    private var servie: XkcdComicsApiProtocol
    private var comicService: ComicPersistenceProtocol
    
    init(servie: XkcdComicsApiProtocol = XkcdComicsApi(), comicService: ComicPersistenceProtocol = ComicsPersistenceManager(context: PersistenceController.shared.container.viewContext)) {
        self.servie = servie
        self.comicService = comicService
    }
    
    var showNext: Bool {
        guard let comic = comic, let currentNum = currentComicNum else { return false }
        return comic.id < currentNum
    }
    
    var showPrevious: Bool {
        guard let comic = comic else { return false }
        return comic.id > 1
    }
}


// MARK: - Methods

extension ComicsViewModel {
    
    func loadComics() async {
        guard currentComicNum == nil else { return }
        await getCurrentComic()
    }
    
    @MainActor
    func getCurrentComic() async {
        do {
           let current = try await servie.getCurrentComic()
            currentComicNum = current.num
            
            // If we open same day and latest comic is already on favourites than don't create new comic instance use locale one
            if let saved = comicService.comic(current.num) {
                comic = saved
                return
            }
            
            comic = Comic(current)
        } catch let error as NetworkError {
            print(error.message)
        }
        catch {
            print(error)
        }
    }
    
    @MainActor
    func getComic(_ num: Int) {
        
        if let saved = comicService.comic(num) {
            comic = saved
            return
        }
        
        Task {
            do {
                let xkcdComic = try await servie.getComic(num)
                comic = Comic(xkcdComic)
            } catch let error as NetworkError {
                print(error.message)
            }
        }
    }
    
    @MainActor
    func getPreviousComic() {
        guard let loadedNum = comic?.id as? Int, loadedNum > 1 else { return }
        getComic(loadedNum - 1)
    }
    
    @MainActor
    func getNextComic() {
        guard let loadedNum = comic?.id as? Int, let current = currentComicNum, loadedNum < current else { return }
        getComic(loadedNum + 1)
    }
    
    func handleFavourite() {
        guard let comic = comic else { return }
        if comic.favourite {
            comicService.save(comic)
            return
        }
        comicService.delete(comic.id)
    }
}
