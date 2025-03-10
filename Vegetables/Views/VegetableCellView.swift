//
//  VegetableCellView.swift
//  Vegetables
//
//  Created by Eric on 10/03/2025.
//

import SwiftUI

struct VegetableCellView: View {

    let vegetable: Vegetable

    var body: some View {
        Text(vegetable.name)
    }
}

#Preview {
    VegetableCellView(vegetable: PreviewData.loadVegetables()[0])
}
