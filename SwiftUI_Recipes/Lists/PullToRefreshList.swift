//
//  PullToRefreshList.swift
//  SwiftUI_Recipes
//
//  Created by Rebaz Salahaddin on 7/2/24.
//

import SwiftUI

struct PullToRefreshList: View {
    
   @State private var dates: [Date] = []
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(dates, id: \.self) { date in
                    Text(date, format: .dateTime)
                }
            }
            .refreshable {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    dates.append(Date())
                }
                
            }
            .navigationTitle("Pull to Refresh")

        }
    }
}

#Preview {
    PullToRefreshList()
}
