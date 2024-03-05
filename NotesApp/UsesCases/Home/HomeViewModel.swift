//
//  HomeViewModel.swift
//  NotesApp
//
//  Created by Andres Aleu on 28/2/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var notes: [NoteModel]
    
    init(notes: [NoteModel]) {
        self.notes = notes
    }
    
    func createNotes(title: String, text: String) {
        let note: NoteModel = NoteModel(title: title, text: text, createdAt: .now)
        notes.append(note)
    }
    
    func updateNote(id: UUID, newTitle: String, newText: String) {
        if let index = notes.firstIndex(where: { $0.id == id }) {
            let updateNote = NoteModel(id: id, title: newTitle, text: newText, createdAt: notes[index].createdAt)
            notes[index] = updateNote
        }
    }
    
    func removeNote(id: UUID) {
        notes.removeAll(where: { $0.id == id })
    }
}
