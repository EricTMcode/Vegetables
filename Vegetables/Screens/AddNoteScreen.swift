//
//  AddNoteScreen.swift
//  Vegetables
//
//  Created by Eric on 11/03/2025.
//

import SwiftUI

struct AddNoteScreen: View {

    @Environment(\.dismiss) private var dismiss

    let myGardenVegetable: MyGardenVegetable

    @State private var noteTitle: String = ""
    @State private var noteBody: String = ""


    var body: some View {
        Form {
            TextField("Title", text: $noteTitle)
            TextEditor(text: $noteBody)
                .frame(minHeight: 200)
        }
        .toolbar {
            
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }

            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {

                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddNoteScreen(myGardenVegetable: MyGardenVegetable(vegetable: PreviewData.loadVegetables()[0], plantOption: .seed))
    }
}
