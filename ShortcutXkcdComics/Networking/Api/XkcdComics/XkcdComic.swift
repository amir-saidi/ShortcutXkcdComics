//
//  XkcdComic.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 17.9.23.
//

import Foundation

struct XkcdComic: Codable {
    let month: String
    let num: Int
    let link: String
    let year: String
    let news: String
//    let safeTitle: String
    let transcript: String
    let alt: String
    let img: String
    let title: String
    let day: String
}

extension XkcdComic {
    var date: Date? {
        guard let year = Int(year), let month = Int(month), let day = Int(day) else { return nil }
        let calendar = Calendar(identifier: .gregorian)
        let components = DateComponents(year: year, month: month, day: day)
        return calendar.date(from: components)!
    }
    
    var dateStr: String {
        "\(month) \(day), \(year)"
    }
}


extension XkcdComic {
    public static let preview = XkcdComic(month: "08", num: 1, link: "", year: "2023", news: "comic news", transcript: "preview comic", alt: "This a preview", img: "https://imgs.xkcd.com/comics/inspiration.png", title: "Preview Comic", day: "28")
}
