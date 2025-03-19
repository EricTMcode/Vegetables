//
//  PestListScreen.swift
//  Vegetables
//
//  Created by Eric on 17/03/2025.
//

import SwiftUI

struct PestListScreen: View {

    let pests: [Pest]
    @State private var search: String = ""

    private var filteredPests: [Pest] {
        if search.isEmptyOrWhitespace {
            return pests
        } else {
            return pests.filter { $0.name.localizedCaseInsensitiveContains(search) }
        }
    }

    var body: some View {
        List(filteredPests) { pest in
            NavigationLink {
                PestDetailScreen(pest: pest)
            } label: {
                PestCellView(pest: pest)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Pests")
        .searchable(text: $search)
    }
}

#Preview(traits: .sampleData) {
    NavigationStack {
        PestListScreen(pests: PreviewData.loadPests())
    }
}
