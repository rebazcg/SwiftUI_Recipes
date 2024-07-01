//
//  AddingRemovingMovingItemInList.swift
//  SwiftUI_Recipes
//
//  Created by Rebaz Salahaddin on 7/1/24.
//

import SwiftUI

struct AddingRemovingMovingItemInList: View {
   
    @State private var taskText: String = ""
    @State private var tasks: [String] = []
    private func deleteTask(at indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    private func moveTask(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
    }
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Enter a task", text: $taskText)
                    Button("Add") {
                        tasks.append(taskText)
                        taskText = ""
                    }
                }
                List {
                    ForEach(tasks, id: \.self) { task in
                        Text(task)
                    }
                    .onDelete(perform: deleteTask)
                    .onMove(perform: moveTask)
                }
                .listStyle(.plain)
            }
            .padding()
            .toolbar {
                EditButton()
            }
        }
    }
}

#Preview {
    AddingRemovingMovingItemInList()
}
