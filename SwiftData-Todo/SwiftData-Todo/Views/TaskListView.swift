//
//  TaskListView.swift
//  SwiftData-Todo
//
//  Created by Mat Schmid on 2023-06-06.
//

import SwiftUI
import SwiftData

struct TaskListView: View {
	@Environment(\.modelContext)
	private var context
	
	@Query(sort: \.createdAt, animation: .smooth)
	private var tasks: [Task]
	
	@State
	var showingAddTask = false
	
	var body: some View {
		NavigationView {
			ListView
			.navigationTitle("Todo")
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					ActionBar
				}
			}
			.sheet(isPresented: $showingAddTask) {
				AddTaskView()
			}
			.overlay {
				if tasks.isEmpty {
					EmptyView
				}
			}
		}
		.tint(.orange)
	}
	
	// MARK: Internal views
	
	@ViewBuilder
	private var ListView: some View {
		List {
			ForEach(tasks) { task in
				TaskView(task: task)
			}
			.onDelete(perform: delete)
		}
	}
	
	@ViewBuilder
	private var ActionBar: some View {
		HStack {
			Spacer()
			Button {
				showingAddTask = true
			} label: {
				Label("Add task", systemImage: "plus")
					.labelStyle(.titleAndIcon)
					.font(.subheadline)
			}
			.buttonStyle(.bordered)
			.controlSize(.mini)
		}
	}
	
	@ViewBuilder
	private var EmptyView: some View {
		ContentUnavailableView {
			Label("No tasks yet", systemImage: "text.badge.plus")
		} description: {
			Text("New tasks you add will appear here.")
		}
	}
	
	// MARK: Data operations
	
	private func delete(indices: IndexSet) {
		for index in indices {
			let task = tasks[index]
			context.delete(task)
		}
		
		do {
			try context.save()
		} catch {
			print(error.localizedDescription)
		}
	}
}

#Preview {
	TaskListView()
}
