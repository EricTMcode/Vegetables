//
//  VegetableListScreen.swift
//  Vegetables
//
//  Created by Eric on 10/03/2025.
//

import SwiftUI

struct VegetableListScreen: View {

    let vegetables: [Vegetable]
    @State private var search: String = ""

    private var filteredVegetables: [Vegetable] {
        if search.isEmptyOrWhitespace {
            return vegetables
        } else {
            return vegetables.filter { $0.name.localizedCaseInsensitiveContains(search) }
        }
    }

    var body: some View {
        List(filteredVegetables) { vegetable in
            NavigationLink {
                VegetableDetailScreen(vegetable: vegetable)
            } label: {
                VegetableCellView(vegetable: vegetable)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Vegetables")
        .searchable(text: $search)
    }
}

#Preview(traits: .sampleData) {
    NavigationStack {
        VegetableListScreen(vegetables: PreviewData.loadVegetables())
    }
}
