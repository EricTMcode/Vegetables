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
        HStack(alignment: .center, spacing: 16) {
            CircularAsyncImageView(url: vegetable.thumbnailImage)

            VStack(alignment: .leading, spacing: 4) {
                Text(vegetable.name)
                    .font(.headline)
                    .foregroundStyle(.primary)
                
                Text(vegetable.body)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }
        }
    }
}

#Preview {
    VegetableCellView(vegetable: PreviewData.loadVegetables()[0])
}
