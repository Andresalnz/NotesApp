//
//  Item.swift
//  NotesApp
//
//  Created by Andres Aleu on 27/2/24.
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
