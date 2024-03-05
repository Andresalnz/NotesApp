//
//  CreateNoteView.swift
//  NotesApp
//
//  Created by Andres Aleu on 28/2/24.
//

import SwiftUI

struct CreateNoteView: View {
    var viewModel: HomeViewModel
    @State var title: String = ""
    @State var text: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("",text: $title, prompt: Text("Titulo"), axis: .vertical)
                        .accessibilityIdentifier("createnote_title_identifier")
                    TextField("",text: $text, prompt: Text("Texto"), axis: .vertical)
                        .accessibilityIdentifier("createnote_text_identifier")
                } footer: {
                    Text("*El titulo es obligatorio")
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                         dismiss()
                    } label: {
                        Text("Cerrar")
                    }
                }
                
                ToolbarItem {
                    Button {
                        viewModel.createNotes(title: title, text: text)
                        dismiss()
                    } label: {
                        Text("Crear Nota")
                            .bold()
                    }
                }
            }
        }
    }
}

#Preview {
    CreateNoteView(viewModel: HomeViewModel(notes: .init()))
}
