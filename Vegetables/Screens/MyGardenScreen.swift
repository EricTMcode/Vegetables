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

    var body: some View {
        List(myGardenVegetables) { myGardenVegetable in
            MyGardenCellView(myGardenVegetable: myGardenVegetable)
        }
        .listStyle(.plain)
        .navigationTitle("My Garden")
    }
}

#Preview {
    NavigationStack {
        MyGardenScreen()
    }
    .modelContainer(previewContainer)
}
