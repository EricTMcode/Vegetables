//
//  MyGardenScreen.swift
//  Vegetables
//
//  Created by Eric on 11/03/2025.
//

import SwiftUI
import SwiftData

struct MyGardenScreen: View {

    @Query private var myGardenVegetables: [MyGardenVegetable]
    @Environment(\.modelContext) private var modelContext

    private func deleteMyGardenVegetable(at offsets: IndexSet) {
        offsets.forEach { index in
            let myGardenVegetable = myGardenVegetables[index]
            modelContext.delete(myGardenVegetable)
            try? modelContext.save()
        }
    }

    var body: some View {
        List {
            ForEach(myGardenVegetables) { myGardenVegetable in
                NavigationLink {
                    NoteListScreen(myGardenVegetable: myGardenVegetable)
                } label: {
                    MyGardenCellView(myGardenVegetable: myGardenVegetable)
                }
            }
            .onDelete(perform: deleteMyGardenVegetable)
        }
        .listStyle(.plain)
        .navigationTitle("My Garden")
    }
}

#Preview(traits: .sampleData) {
    NavigationStack {
        MyGardenScreen()
    }
}
