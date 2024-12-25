//
//  TaskManagerApp.swift
//  TaskManager
//
//  Created by Saurabh Jaiswal on 25/12/24.
//

import SwiftUI

@main
struct TaskManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandMenu("Task") {
                Button("Add New Task") {
                    
                }
                .keyboardShortcut(KeyEquivalent("r"), modifiers: .command)
            }
            CommandGroup(after: .newItem) {
                Button("Add New Group") {
                    
                }
            }
        }
        WindowGroup("Special") {
            Text("special window")
                .frame(minWidth: 200, idealWidth: 300, minHeight: 200)
        }
        .defaultPosition(.leading)
        
        Settings {
            Text("Setting")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
        MenuBarExtra("Menu") {
            Button("Do something amazing") {
                
            }
        }
    }
}
