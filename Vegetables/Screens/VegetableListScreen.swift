//
//  VegetableListScreen.swift
//  Vegetables
//
//  Created by Eric on 10/03/2025.
//

import SwiftUI

struct VegetableListScreen: View {

    @State private var vegetables: [Vegetable] = []

    var body: some View {
        List(vegetables) { vegetable in
            VegetableCellView(vegetable: vegetable)
        }
        .listStyle(.plain)
        .task {
            do {
                let client = VegetableHTTPClient()
                vegetables = try await client.fetchVegetables()
            } catch {
                print(error.localizedDescription)
            }
        }
        .navigationTitle("Vegetables")
    }
}

#Preview {
    NavigationStack {
        VegetableListScreen()
    }
}
