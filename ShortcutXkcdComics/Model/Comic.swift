//
//  Comic.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 17.9.23.
//

import SwiftUI

class Comic: ObservableObject {
    private(set) var id: Int
    private(set) var title: String
    private(set) var dateStr: String
    private(set) var img: String
    private(set) var news: String?
    private(set) var transcript: String?
    private(set) var alt: String?
    
    @Published var favourite: Bool
    @Published var image: UIImage?
    
    init(
        id: Int,
        title: String,
        dateStr: String,
        img: String,
        news: String?,
        transcript: String?,
        alt: String?,
        image: UIImage? = nil
    ) {
        self.id = id
        self.title = title
        self.dateStr = dateStr
        self.img = img
        self.news = news
        self.transcript = transcript
        self.alt = alt
        self.favourite = true
        self.image = image
    }
    
    init(_ xkcdComic: XkcdComic) {
        self.id = xkcdComic.num
        self.title = xkcdComic.title
        self.dateStr =  xkcdComic.date?.toFormattedDate() ?? xkcdComic.dateStr
        self.img = xkcdComic.img
        self.news = xkcdComic.news
        self.transcript = xkcdComic.transcript
        self.alt = xkcdComic.alt
        self.favourite = false
        
        DispatchQueue.main.async { [weak self] in
            self?.loadImage()
        }
    }
}

extension Comic {
    
    @MainActor
    func loadImage() {
        guard self.image == nil else { return }
        Task {
            do {
                self.image = try await ImageLoader.loadImage(url: URL(string: self.img))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

extension Comic {
    public static let preview = Comic(id: 1, title: "Preview Comic", dateStr: "28-08-2023", img: "https://imgs.xkcd.com/comics/inspiration.png", news: "Comic news", transcript: "Comic transript", alt: "Comic alt", image: UIImage(named: "comicImage"))
}
