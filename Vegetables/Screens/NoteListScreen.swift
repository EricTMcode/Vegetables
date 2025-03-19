//
//  NoteListScreen.swift
//  Vegetables
//
//  Created by Eric on 11/03/2025.
//

import SwiftUI
import SwiftData

struct NoteListScreen: View {

    @Environment(\.modelContext) private var modelContext
    let myGardenVegetable: MyGardenVegetable
    
    @State private var addNotePresented = false

    private func deleteNote(at offsets: IndexSet) {
        offsets.forEach { index in
            let note = myGardenVegetable.notes![index]
            modelContext.delete(note)
            try? modelContext.save()
        }
    }

    var body: some View {
        List {
            ForEach(myGardenVegetable.notes ?? []) { note in
                NoteCellView(note: note, placeHolderImage: myGardenVegetable.vegetable.thumbnailImage)
            }
            .onDelete(perform: deleteNote)
        }
        .navigationTitle(myGardenVegetable.vegetable.name)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add Note") {
                    addNotePresented = true
                }
            }
        }
        .sheet(isPresented: $addNotePresented) {
            NavigationStack {
                AddNoteScreen(myGardenVegetable: myGardenVegetable)
            }
        }
    }
}

#Preview(traits: .sampleData) {
    
    @Previewable @Query var myGardenVegetables: [MyGardenVegetable]
    
    NavigationStack {
        NoteListScreen(myGardenVegetable: myGardenVegetables[0])
    }
}
