//
//  Details.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 18.9.23.
//

import SwiftUI

struct Details: View {
    
    var comic: Comic
    
    var body: some View {
        List {
            Section {
                if let uiImage = comic.image  {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 400)
                } else {
                    ProgressView()
                        .frame(maxHeight: 400)
                }
                
            }
            
            Section {
                DetailsRow(title: "Title", value: "\(comic.title)")
                DetailsRow(title: "Release", value: comic.dateStr)
            }
            
            Section {
                if let transcript = comic.transcript, transcript != "" {
                    DetailsRow(title: "Tanscript", value: transcript)
                }
                
                if let news = comic.news, news != "" {
                    DetailsRow(title: "News", value: news)
                }
                
                if let alt = comic.alt, alt != "" {
                    DetailsRow(title: "Alt", value: alt)
                }
            }
        }
        .navigationTitle(String(format: "#%d", comic.id))
    }
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        Details(comic: Comic.preview)
    }
}
