//
//  GroupingItemsInList.swift
//  SwiftUI_Recipes
//
//  Created by Rebaz Salahaddin on 7/2/24.
//

import SwiftUI

struct GroupingItemsInList: View {
    
    var posts: [Post] = [
        
        Post(title: "Post #1", comments: [
            Comment(title: "Comment #1 for Post #1"),
            Comment(title: "Comment #2 for Post #1")
        ]),
        Post(title: "Post #2", comments: [
            Comment(title: "Comment #1 for Post #2"),
            Comment(title: "Comment #2 for Post #2"),
            Comment(title: "Comment #3 for Post #2")
        ])
        ,
        Post(title: "Post #3", comments: [
            Comment(title: "Comment #1 for Post #3")
        ])
        
    ]
    
    
    var body: some View {
        
        List {
            ForEach(posts) { post in
                Section {
                    ForEach(post.comments) { comment in
                        Text(comment.title)
                            .font(.footnote.italic())
                    }
                } header: {
                    Text(post.title)
                }
                
            }
        }
        .listStyle(.insetGrouped)
    }
}


struct Comment: Identifiable {
    let id = UUID()
    var title: String
}

struct Post: Identifiable {
    let id = UUID()
    var title: String
    var comments: [Comment]
}

#Preview {
    GroupingItemsInList()
}
