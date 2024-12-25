//
//  ContentView.swift
//  TaskManager
//
//  Created by Saurabh Jaiswal on 25/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = TaskSection.all
    
    @State private var allTasks: [Task] = Task.examples()
    
    @State private var userCreatedGroups: [TaskGroup] = TaskGroup.examples()
    
    var body: some View {
        NavigationSplitView {
            SidebarView(userCreatedGroups: userCreatedGroups, selection: $selection)
        } detail: {
            switch selection {
            case .all:
                TaskListView(title: "All", tasks: allTasks)
            case .upcoming:
                TaskListView(title: "Upcoming", tasks: allTasks.filter({
                    !$0.isCompleted
                }))
            case .done:
                TaskListView(title: "Done", tasks: allTasks.filter({
                    $0.isCompleted
                }))
            case .list(let taskGroup):
                TaskListView(title: taskGroup.title, tasks: taskGroup.tasks)
            }
        }
    }
}

#Preview {
    ContentView()
}
