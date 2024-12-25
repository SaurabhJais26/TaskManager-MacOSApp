//
//  TaskView.swift
//  TaskManager
//
//  Created by Saurabh Jaiswal on 25/12/24.
//

import SwiftUI

struct TaskView: View {
    
    @Binding var task: Task
    @Binding var selectedTask: Task?
    @Binding var inspectorIsShown: Bool
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "largecircle.fill.circle" : "circle")
                .onTapGesture {
                    task.isCompleted.toggle()
                }
            TextField("New Task", text: $task.title)
                .textFieldStyle(.plain)
            
            Button {
                inspectorIsShown = true
                selectedTask = task
            } label: {
                Text("More")
            }

        }
    }
}

#Preview {
    TaskView(task: .constant(Task.example()), selectedTask: .constant(nil), inspectorIsShown: .constant(false))
}
