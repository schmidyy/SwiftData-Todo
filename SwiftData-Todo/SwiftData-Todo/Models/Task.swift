//
//  Task.swift
//  SwiftData-Todo
//
//  Created by Mat Schmid on 2023-06-05.
//

import Foundation
import SwiftData

@Model
final class Task {
	@Attribute(.unique)
	var id: UUID
	
	var name: String
	var createdAt: Date
	var completed: Bool
	var color: String
	
	init(name: String, createdAt: Date = Date(), completed: Bool = false, color: TaskColor) {
		self.id = UUID()
		self.name = name
		self.createdAt = createdAt
		self.completed = completed
		self.color = color.rawValue
	}
}
