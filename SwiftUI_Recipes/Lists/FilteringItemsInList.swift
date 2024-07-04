//
//  FilteringItemsInList.swift
//  SwiftUI_Recipes
//
//  Created by Rebaz Salahaddin on 7/4/24.
//

import SwiftUI


struct FilteringItemsInList: View {
    
    @State private var searchedText: String = ""
    
    var searchedResult: [FavoritePlace] {
        if !searchedText.isEmpty {
            return FavoritePlace.places.filter { filteredPlace in
                filteredPlace.name.lowercased().contains(searchedText.lowercased())
            }
        } else {
            return FavoritePlace.places
        }
    }
    
    var body: some View {
        NavigationStack {
            List(searchedResult) { place in
                HStack(alignment: .top) {
                    Image(place.photo)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 75, height: 75)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
                    
                    Text(place.name)
                        .font(.headline.italic())
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Searchable List")
            .searchable(text: $searchedText, prompt: "Search")
        }
    }
}


#Preview {
    FilteringItemsInList()
}


struct FavoritePlace: Identifiable {
    let id = UUID()
    var name: String
    var photo: String
    
    static var places: [FavoritePlace] = [
        FavoritePlace(name: "NewYork", photo: "ny"),
        FavoritePlace(name: "London", photo: "london"),
        FavoritePlace(name: "Tokyo", photo: "tokyo"),
        FavoritePlace(name: "Paris", photo: "paris")
    ]
}




