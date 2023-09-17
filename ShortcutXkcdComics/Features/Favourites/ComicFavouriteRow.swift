//
//  ComicFavouriteRow.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 17.9.23.
//

import SwiftUI

struct ComicFavouriteRow: View {
    
    var comic: ComicEntity
    
    var body: some View {
        HStack {
            if let uiImage = UIImage(data: comic.imageData)  {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 90, height: 140)
            }
            
            VStack(alignment: .leading) {
                Text(comic.title)
                    .font(.title3)
                    .bold()
                
                Text(comic.dateStr)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Spacer()
            }
            .padding(.vertical, 8)
            Spacer()
        }
    }
}

struct ComicFavouriteRow_Previews: PreviewProvider {
    static var previews: some View {
        ComicFavouriteRow(comic: PersistenceController.previewItem())
    }
}
