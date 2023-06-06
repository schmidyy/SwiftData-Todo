//
//  SwiftData_TodoApp.swift
//  SwiftData-Todo
//
//  Created by Mat Schmid on 2023-06-05.
//

import SwiftUI
import SwiftData

@main
struct SwiftData_TodoApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
