//
//  ContentView.swift
//  TaskManager
//
//  Created by Saurabh Jaiswal on 25/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: TaskSection? = TaskSection.all
    
    @State private var allTasks = Task.examples()
    
    @State private var userCreatedGroups: [TaskGroup] = TaskGroup.examples()
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationSplitView {
            SidebarView(userCreatedGroups: $userCreatedGroups, selection: $selection)
        } detail: {
            if searchText.isEmpty {
                switch selection {
                case .all:
                    TaskListView(title: "All", tasks: $allTasks)
                case .upcoming:
                    StaticTaskListView(title: "Upcoming", tasks: allTasks.filter({
                        !$0.isCompleted
                    }))
                case .done:
                    StaticTaskListView(title: "Done", tasks: allTasks.filter({
                        $0.isCompleted
                    }))
                case .list(let taskGroup):
                    StaticTaskListView(title: taskGroup.title, tasks: taskGroup.tasks)
                case .none:
                    Text("None")
                }
            } else {
                StaticTaskListView(title: "All", tasks: allTasks.filter({
                    $0.title.contains(searchText)
                }))
            }
            
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    ContentView()
}
