//
//  HidingListRowSeperatorInList.swift
//  SwiftUI_Recipes
//
//  Created by Rebaz Salahaddin on 7/2/24.
//

import SwiftUI

struct HidingListRowSeperatorInList: View {
    var body: some View {
        NavigationStack {
            List(1...20, id: \.self) { index in
                
                Text("\(index)")
                    .font(.title)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    HidingListRowSeperatorInList()
}
