//
//  SearchField.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 17.9.23.
//

import SwiftUI

struct SearchField: View {
    
    @Binding var searchTerm: String
    @FocusState private var isFocused
    var onCommit: (() -> Void)
    
    var body: some View {
        HStack {
            HStack(spacing: 4) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.primary.opacity(0.3))
                TextField("Search Comic number", text: $searchTerm, onCommit: onCommit)
                    .keyboardType(.numberPad)
                    .focused($isFocused)
            }
            .padding(8)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 0.5)
        }
            if isFocused {
                Button {
                    onCommit()
                    isFocused.toggle()
                } label: {
                    Text(searchTerm == "" ? "Cancel" : "Search")
                        .padding(8)
                }
            }

        }
        
    }
}

struct SearchField_Previews: PreviewProvider {
    static var previews: some View {
        SearchField(searchTerm: .constant(""), onCommit: {
            print("on Commit")
        })
    }
}
