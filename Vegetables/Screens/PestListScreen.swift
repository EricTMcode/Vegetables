//
//  PestListScreen.swift
//  Vegetables
//
//  Created by Eric on 17/03/2025.
//

import SwiftUI

struct PestListScreen: View {

    let pests: [Pest]

    var body: some View {
        List(pests) { pest in
            PestCellView(pest: pest)
        }
        .listStyle(.plain)
        .navigationTitle("Pests")
    }
}

#Preview(traits: .sampleData) {
    NavigationStack {
        PestListScreen(pests: PreviewData.loadPests())
    }
}
