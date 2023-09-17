//
//  ComicsView.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 17.9.23.
//

import SwiftUI

struct Comics: View {
    
    @StateObject private var viewModel = ComicsViewModel()
    @State var searchTerm = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 8) {
                    SearchField(searchTerm: $searchTerm) {
                        if let comicNum = Int(searchTerm) {
                            viewModel.getComic(comicNum)
                            searchTerm = ""
                        }
                    }
                    
                    if let comic = viewModel.comic {
                            VStack {
                                ComicView(comic: comic) {
                                    viewModel.handleFavourite()
                                }
                                
                                HStack {
                                    if viewModel.showPrevious {
                                        ActionButton(image: Image(systemName: "chevron.left")) {
                                            viewModel.getPreviousComic()
                                        }
                                    }
                                    
                                    if viewModel.showNext {
                                        ActionButton(image: Image(systemName: "chevron.right")) {
                                            viewModel.getNextComic()
                                        }
                                    }
                                }
                            }
                    } else {
                        ProgressView()
                    }
                }
                .padding([.horizontal, .bottom])
                .ignoresSafeArea(.keyboard)
                
            }
            .navigationTitle("Xkcd Comics")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await viewModel.loadComics()
            }

        }
        
    }
}

struct Comics_Previews: PreviewProvider {
    static var previews: some View {
        Comics()
    }
}
