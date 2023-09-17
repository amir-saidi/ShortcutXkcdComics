//
//  FavouritesView.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 17.9.23.
//

import SwiftUI

struct Favourites: View {
    @StateObject private var favouritesViewModel = FavouritesViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(favouritesViewModel.comics) { comic in
                    NavigationLink {
                        Details(comic: favouritesViewModel.details(comic))
                    } label: {
                        ComicFavouriteRow(comic: comic)
                            .padding(.vertical, 8)
                    }
                }
                .onDelete(perform: favouritesViewModel.delete(_:))
            }
            .navigationTitle("Favourites")
            .listStyle(.plain)
            .task {
                favouritesViewModel.loadComic()
            }
        }
    }
}

struct Favourites_Previews: PreviewProvider {
    static var previews: some View {
        Favourites()
    }
}
