//
//  ComicView.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 17.9.23.
//

import SwiftUI

struct ComicView: View {
    
    @ObservedObject var comic: Comic
    var favouriteAction: (() -> Void)?
    
    var body: some View {
        VStack(spacing: Constants.defaultPadding) {
            
            GeometryReader { geometry in
                
                if let uiImage = comic.image  {
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
                        .padding([.horizontal, .top])
                } else {
                    ProgressView()
                        .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
                        .padding([.horizontal, .top])
                }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(String(format: "#%d", comic.id))
                        .foregroundColor(.accentColor)
                    Spacer()
                    Text(comic.dateStr)
                        .foregroundColor(.gray)
                    Spacer()
                    Button {
                        comic.favourite.toggle()
                        favouriteAction?()
                    } label: {
                        Image(systemName: comic.favourite ? "heart.fill" : "heart")
                            .foregroundColor(comic.favourite ? .red : .primary)
                    }
                    
                }
                .font(.system(size: 20, weight: .regular))
                
                Text(comic.title)
                    .font(.title2)
                    .fontWeight(.medium)
                
            }
            .padding([.horizontal, .bottom])
        }
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 0.5)
        }
    }
}

struct ComicView_Previews: PreviewProvider {
    static var previews: some View {
        ComicView(comic: Comic.preview)
    }
}
