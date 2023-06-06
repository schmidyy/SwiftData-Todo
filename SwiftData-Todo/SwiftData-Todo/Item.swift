//
//  Item.swift
//  SwiftData-Todo
//
//  Created by Mat Schmid on 2023-06-05.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
