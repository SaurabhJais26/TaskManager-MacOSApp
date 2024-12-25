//
//  TaskListView.swift
//  TaskManager
//
//  Created by Saurabh Jaiswal on 25/12/24.
//

import SwiftUI

struct TaskListView: View {
    let title: String
    @Binding var tasks: [Task]
    @State private var selectedTask: Task? = nil
    
    @State private var inspectorIsShown: Bool = false
    
    var body: some View {
        List($tasks) { $task in
            TaskView(task: $task, selectedTask: $selectedTask, inspectorIsShown: $inspectorIsShown)
        }
        .navigationTitle(title)
        .toolbar {
            ToolbarItemGroup {
                Button {
                    tasks.append(Task(title: "New Task"))
                } label: {
                    Label("Add New Task", systemImage: "plus")
                }
                
                Button {
                    inspectorIsShown.toggle()
                } label: {
                    Label("Show Inspector", systemImage: "sidebar.right")
                }
            }
        }
        .inspector(isPresented: $inspectorIsShown) {
            Group {
                if let selectedTask {
                    Text(selectedTask.title).font(.title)
                } else {
                    Text("Nothing seems selected")
                }
            }
            .frame(minWidth: 100, maxWidth: .infinity)
        }
    }
}

#Preview {
    TaskListView(title: "All", tasks: .constant(Task.examples()))
}
