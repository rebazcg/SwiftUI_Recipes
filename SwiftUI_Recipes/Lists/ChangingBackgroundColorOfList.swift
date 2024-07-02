//
//  ChangingBackgroundColorOfList.swift
//  SwiftUI_Recipes
//
//  Created by Rebaz Salahaddin on 7/2/24.
//

import SwiftUI

struct ChangingBackgroundColorOfList: View {
    var body: some View {
        List {
            ForEach(1...20, id: \.self) { index in
            Text("\(index)")
                    .font(.title)
                
            }
            // To make .listRowBackground work, ForEach should be used
            .listRowBackground(Color.yellow)
        }
        
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding()
        // Using the .plain listStyle to remove all the default styling of the list, then applying .background will change the background
        .listStyle(.plain)
        .background(Color.green)
    }
}

#Preview {
    ChangingBackgroundColorOfList()
}
