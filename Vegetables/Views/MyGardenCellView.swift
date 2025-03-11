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
            CircularAsyncImageView(url: myGardenVegetable.vegetable.thumbnailImage)

            VStack(alignment: .leading, spacing: 4) {
                Text(myGardenVegetable.vegetable.name)
                    .font(.headline)
                    .foregroundStyle(.primary)

                HStack {
                    Image(systemName: myGardenVegetable.plantOption.icon)
                        .foregroundStyle(.green)
                }
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    MyGardenCellView(myGardenVegetable: MyGardenVegetable(vegetable: PreviewData.loadVegetables()[0], plantOption: .seed))
}
