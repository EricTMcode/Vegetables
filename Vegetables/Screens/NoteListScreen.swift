//
//  NoteListScreen.swift
//  Vegetables
//
//  Created by Eric on 11/03/2025.
//

import SwiftUI
import SwiftData

struct NoteListScreen: View {
    
    let myGardenVegetable: MyGardenVegetable
    
    @State private var addNotePresented = false
    
    var body: some View {
        List(myGardenVegetable.notes ?? []) { note in
            NoteCellView(note: note, placeHolderImage: myGardenVegetable.vegetable.thumbnailImage)
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
