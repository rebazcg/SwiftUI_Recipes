//
//  SwipeActionInList.swift
//  SwiftUI_Recipes
//
//  Created by Rebaz Salahaddin on 7/9/24.
//

import SwiftUI

struct SwipeActionInList: View {
    @State private var places: [String] = [
        "london", "paris", "ny", "tokyo"
    ]
    var body: some View {
        List(places, id: \.self) { place in
            HStack {
                Image(place)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .shadow(radius: 3)
                Text(place.uppercased())
                    .font(.headline)
            }
            .swipeActions(edge: .trailing) {
                Button(role: .destructive) {
                    //
                } label: {
                    Label("Delete", systemImage: "trash")
                }
            }
            .swipeActions(edge: .leading) {
                Button {
                    //
                } label: {
                    Label("Archive", systemImage: "archivebox")
                }
                .tint(Color.gray)
                
                Button {
                    //
                } label: {
                    Label("Favorite", systemImage: "heart.fill")
                }
                .tint(Color.yellow)
            }
        }
    }
}

#Preview {
    SwipeActionInList()
}
