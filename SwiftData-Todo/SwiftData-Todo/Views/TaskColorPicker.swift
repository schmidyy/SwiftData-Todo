//
//  TaskColorPicker.swift
//  SwiftData-Todo
//
//  Created by Mat Schmid on 2023-06-06.
//

import SwiftUI

struct TaskColorPicker: View {
	@Binding var selectedColor: TaskColor
	
	var body: some View {
		VStack(alignment: .leading) {
			Text("Tag")
				.font(.callout)
			HStack {
				ForEach(TaskColor.allCases, id: \.self) { taskColor in
					Button {
						selectedColor = taskColor
					} label: {
						Image(systemName: selectedColor == taskColor ? "circle.circle.fill" : "circle")
							.resizable()
							.scaledToFit()
							.frame(width: 28, height: 28)
					}
					.buttonStyle(.borderless)
					.foregroundColor(taskColor.representable)
					.frame(maxWidth: .infinity)
				}
			}
		}
	}
}

#Preview {
	TaskColorPicker(selectedColor: .constant(.red))
}
