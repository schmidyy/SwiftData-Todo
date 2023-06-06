//
//  TaskColor.swift
//  SwiftData-Todo
//
//  Created by Mat Schmid on 2023-06-06.
//

import SwiftUI

enum TaskColor: String, CaseIterable {
	case red, orange, yellow, green, blue, purple
	
	var representable: Color {
		switch self {
		case .red:
			return .red
		case .orange:
			return .orange
		case .yellow:
			return .yellow
		case .green:
			return .green
		case .blue:
			return .blue
		case .purple:
			return .purple
		}
	}
}
