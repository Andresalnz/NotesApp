//
//  NoteModel.swift
//  NotesApp
//
//  Created by Andres Aleu on 28/2/24.
//

import Foundation

struct NoteModel: Identifiable, Hashable {
    let id: UUID
    let title: String
    let text: String?
    let createdAt: Date
    
    init(id: UUID = UUID(), title: String, text: String?, createdAt: Date) {
        self.id = id
        self.title = title
        self.text = text
        self.createdAt = createdAt
    }
}
