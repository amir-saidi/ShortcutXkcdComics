//
//  DetailsRow.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 18.9.23.
//

import SwiftUI

struct DetailsRow: View {
    
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(.gray)
                    
                Text(value)
                    .font(.system(size: 17, weight: .semibold))
            }
            .padding(.vertical, 8)
            
            Spacer()
        }
        
    }
}

struct DetailsRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailsRow(title: "Title", value: "Preview")
    }
}
