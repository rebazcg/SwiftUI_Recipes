//
//  ScrollToItemInList.swift
//  SwiftUI_Recipes
//
//  Created by Rebaz Salahaddin on 7/9/24.
//

import SwiftUI

struct ScrollToItemInList: View {
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                Button("Scroll to 100") {
                    withAnimation {
                        proxy.scrollTo(200)
                    }
                }
                List(0..<500, id: \.self) { index in
                Text("\(index)")
                        .id(index)
                }
            }
            
        }
    }
}

#Preview {
    ScrollToItemInList()
}
