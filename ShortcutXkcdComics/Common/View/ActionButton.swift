//
//  ActionButton.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 17.9.23.
//

import SwiftUI

struct ActionButton: View {
    var image: Image
    
    var foregroundColor: Color = .accentColor
    var backgroundColor: Color = .accentColor.opacity(0.06)
    
    var action: (() -> Void)?
    
    var body: some View {
        Button {
            action?()
        } label: {
            HStack {
                image
                    .font(.body)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            
        }

    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(image: Image(systemName: "chevron.left"))
    }
}
