//
//  AddTaskView.swift
//  SwiftData-Todo
//
//  Created by Mat Schmid on 2023-06-06.
//

import SwiftUI
import SwiftData

struct AddTaskView: View {
	@Environment(\.modelContext)
	private var context
	
	@Environment(\.dismiss)
	var dismiss
	
	@State
	private var taskName: String = ""
	
	@State
	private var taskColor = TaskColor.red
	
	var body: some View {
		NavigationView {
			VStack {
				Form {
					Section {
						TextField("Task", text: $taskName)
						TaskColorPicker(selectedColor: $taskColor)
					}
				}
			}
			.navigationTitle("New task")
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
					Button {
						dismiss()
					} label: {
						Text("Cancel")
					}
				}
				ToolbarItem(placement: .navigationBarTrailing) {
					Button {
						save()
					} label: {
						Text("Save")
					}
					.buttonStyle(.bordered)
					.controlSize(.mini)
				}
			}
			.tint(.orange)
		}
	}
	
	private func save() {
		guard taskName.isEmpty == false else { return }
		
		let newTask = Task(
			name: taskName,
			color: taskColor
		)
		context.insert(newTask)
		
		do {
			try context.save()
		} catch {
			print(error.localizedDescription)
		}
		
		dismiss()
	}
}

#Preview {
	AddTaskView()
}
