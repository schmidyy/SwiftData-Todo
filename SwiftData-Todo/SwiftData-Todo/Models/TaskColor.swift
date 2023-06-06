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
		case .red: .red
		case .orange: .orange
		case .yellow: .yellow
		case .green: .green
		case .blue: .blue
		case .purple: .purple
		}
	}
}
