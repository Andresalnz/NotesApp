//
//  UpdateNoteView.swift
//  NotesApp
//
//  Created by Andres Aleu on 28/2/24.
//

import SwiftUI

struct UpdateNoteView: View {
    
    var viewModel: HomeViewModel
       let identifier: UUID
       @State var title: String = ""
       @State var text: String = ""
       
       @Environment(\.dismiss) private  var dismiss
    
    var body: some View {
        VStack {
            TextField("", text: $title, prompt: Text("Titulo"), axis: .vertical)
            TextField("", text: $text, prompt: Text("Texto"), axis: .vertical)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        Button(action: {
            viewModel.removeNote(id: identifier)
            dismiss()
        }, label: {
            Text("Eliminar Nota")
                .foregroundStyle(.gray)
                .underline()
        })
        .buttonStyle(BorderlessButtonStyle())
        .toolbar {
            ToolbarItem {
                Button {
                    viewModel.updateNote(id: identifier, newTitle: title, newText: text)
                    dismiss()
                } label: {
                    Text("Guardar")
                        .bold()
                }
            }
        }
    }
}

#Preview {
    UpdateNoteView(viewModel: HomeViewModel(notes: []), identifier: .init(), title: "Una nota", text: "Esto es una nota")
}
