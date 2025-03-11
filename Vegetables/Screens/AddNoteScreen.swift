//
//  AddNoteScreen.swift
//  Vegetables
//
//  Created by Eric on 11/03/2025.
//

import SwiftUI

struct AddNoteScreen: View {

    let myGardenVegetable: MyGardenVegetable

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AddNoteScreen(myGardenVegetable: MyGardenVegetable(vegetable: PreviewData.loadVegetables()[0], plantOption: .seed))
}
