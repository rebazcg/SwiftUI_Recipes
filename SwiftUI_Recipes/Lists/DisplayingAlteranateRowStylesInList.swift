//
//  DisplayingAlteranateRowStylesInList.swift
//  SwiftUI_Recipes
//
//  Created by Rebaz Salahaddin on 7/1/24.
//

import SwiftUI

struct DisplayingAlteranateRowStylesInList: View {
    
    let animals = ["🐕", "🐈", "🐎", "🧸", "🦁", "🦒", "🐿️"]
    
    var body: some View {
        customRowBGColor
    }
    
     // Starting Point
    var startingView: some View {
        List(animals, id: \.self) { animal in
            Text(animal)
                .font(.largeTitle)
        }
    }
    
    // Using Indices
   var usingIndices: some View {
       List(animals.indices, id: \.self) { index in
           Text(animals[index])
               .font(.largeTitle)
       }
   }
    
    // Custom Row Background Color
   var customRowBGColor: some View {
       List(animals.indices, id: \.self) { index in
           HStack {
               Text(animals[index])
                   .font(.largeTitle)
               Spacer()
           }
           .background(index % 2 == 0 ? Color.cyan : Color.purple)
       }
   }
}

#Preview {
    DisplayingAlteranateRowStylesInList()
}
