//
//  TaskView.swift
//  SwiftData-Todo
//
//  Created by Mat Schmid on 2023-06-06.
//

import SwiftUI
import SwiftData

struct TaskView: View {
	@Environment(\.modelContext)
	private var context
	
	private var task: Task
	
	public init(task: Task) {
		self.task = task
	}
	
	private var taskColor: TaskColor {
		TaskColor(rawValue: task.color) ?? .orange
	}
	
	var body: some View {
		HStack {
			Button(action: toggleCompleted) {
				Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
					.foregroundColor(taskColor.representable)
			}
			Text(task.name)
				.foregroundColor(task.completed ? .secondary : .primary)
		}
	}
	
	private func toggleCompleted() {
		task.completed.toggle()
		
		do {
			try context.save()
		} catch {
			print(error.localizedDescription)
		}
	}
}
