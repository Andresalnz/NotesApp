//
//  HomeNotesView.swift
//  NotesApp
//
//  Created by Andres Aleu on 28/2/24.
//

import SwiftUI

struct HomeNotesView: View {
    
    @StateObject var viewModel: HomeViewModel
    @State var showCreateNote: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.notes, id: \.id){ note in
                    NavigationLink(value: note) {
                        VStack(alignment: .leading) {
                            Text(note.title)
                                .foregroundStyle(.primary)
                            Text(note.text ?? "")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .status) {
                    Button(action: {
                        showCreateNote.toggle()
                    }, label: {
                        Label("Crear Nota", systemImage: "square.and.pencil")
                            .labelStyle(TitleAndIconLabelStyle())
                    })
                    .buttonStyle(.bordered)
                    .tint(.blue)
                    .bold()
                }
            }
            .navigationTitle("Notas")
            .navigationDestination(for: NoteModel.self) { note in
                VStack {
                    UpdateNoteView(viewModel: viewModel, identifier: note.id, title: note.title, text: note.text ?? "")
                }
            }
            .fullScreenCover(isPresented: $showCreateNote, content: {
                
                CreateNoteView(viewModel: viewModel)
            })
            
        }
    }
}

#Preview {
    HomeNotesView(viewModel: HomeViewModel(notes: [.init(title: "Andres", text: "Yo mismo", createdAt: .now)]))
}
