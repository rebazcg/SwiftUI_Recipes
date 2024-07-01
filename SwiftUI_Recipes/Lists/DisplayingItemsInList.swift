//
//  DisplayingItemsInList.swift
//  SwiftUI_Recipes
//
//  Created by Rebaz Salahaddin on 7/1/24.
//

import SwiftUI

struct DisplayingItemsInList: View {
    let friendsV1: [FriendV1] = [
        FriendV1(name: "John"),
        FriendV1(name: "Joe"),
        FriendV1(name: "Mary")
    ]
    let friendsV2: [FriendV2] = [
        FriendV2(name: "John"),
        FriendV2(name: "Joe"),
        FriendV2(name: "Mary")
    ]
    let friendsV3: [FriendV3] = [
        FriendV3(name: "John"),
        FriendV3(name: "Joe"),
        FriendV3(name: "Mary")
    ]
    var body: some View {
        iteratingThroughIndices
    }
    
    // Displaying Range of numbers
    var rangeOfNumbers: some View {
        List(1...20, id: \.self) { index in
        Text("\(index)")
        }
    }
    
    // Displaying Custom Objects Version 1
    var customObjectV1: some View {
        // We use name as an id and we say each name is unique
        // Since name is a string, so it is hashable and can be used as an id
        List(friendsV1, id: \.name) { friend in
            Text(friend.name)
        }
    }
    
    // Displaying Custom Objects Version 2
    var customObjectV2: some View {
        // We use id as an id and we say each id is unique
        // Since we know there could be two identical names,using unique id is better as each id will be unique.
        List(friendsV2, id: \.id) { friend in
            Text(friend.name)
        }
    }
    
    // Displaying Custom Objects Version 3
    var customObjectV3: some View {
        // Conforming the custom object to Identifiable protocol will guarantee that each item will be unique, which SwiftUI uses id behind the scenes to make this happen.
        List(friendsV3) { friend in
            Text(friend.name)
        }
    }
    
    // Iterating through indices
    var iteratingThroughIndices: some View {
        
        List(friendsV3.indices, id: \.self) { index in
            HStack {
                Text("\(index + 1)")
                Text(friendsV3[index].name)
            }
        }
    }
}

#Preview {
    DisplayingItemsInList()
}

struct FriendV1 {
    let name: String
}
struct FriendV2 {
    let id = UUID()
    let name: String
}
struct FriendV3: Identifiable {
    // We have to have id as it conforms to Identifiable
    let id = UUID()
    let name: String
}
