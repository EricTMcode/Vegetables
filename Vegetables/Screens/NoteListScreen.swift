//
//  NoteListScreen.swift
//  Vegetables
//
//  Created by Eric on 11/03/2025.
//

import SwiftUI

struct NoteListScreen: View {

    let myGardenVegetable: MyGardenVegetable

    @State private var addNotePresented = false

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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

#Preview {
    NavigationStack {
        NoteListScreen(myGardenVegetable: MyGardenVegetable(vegetable: PreviewData.loadVegetables()[0], plantOption: .seed))
    }
}
