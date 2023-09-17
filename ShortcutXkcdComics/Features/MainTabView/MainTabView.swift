//
//  MainTabView.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 17.9.23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Comics()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            Favourites()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favourites")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
