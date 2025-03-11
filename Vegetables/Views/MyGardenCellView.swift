//
//  MyGardenCellView.swift
//  Vegetables
//
//  Created by Eric on 11/03/2025.
//

import SwiftUI

struct MyGardenCellView: View {

    let myGardenVegetable: MyGardenVegetable

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            CircularAsyncImage(url: myGardenVegetable.vegetable.thumbnailImage)
        }
    }
}

#Preview {
    MyGardenCellView(myGardenVegetable: MyGardenVegetable(vegetable: PreviewData.loadVegetables()[0], plantOption: .seed))
}
