//
//  VegetableTabBarScreen.swift
//  Vegetables
//
//  Created by Eric on 10/03/2025.
//

import SwiftUI

struct VegetableTabBarScreen: View {

    @State private var vegetables: [Vegetable] = []

    private var pests: [Pest] {

        let allPests = vegetables.flatMap { $0.pests ?? [] }

         return Array(Set(allPests.map { $0.name.lowercased() }))
            .compactMap { name in
                allPests.first { $0.name.lowercased() == name }
            }
    }

    var body: some View {
        TabView {
            NavigationStack {
                VegetableListScreen(vegetables: vegetables)
            }
            .tabItem {
                Label("Vegetables", systemImage: "leaf")
            }

            NavigationStack {
                MyGardenScreen()
            }
            .tabItem {
                Label("My Garden", systemImage: "house")
            }
            
            NavigationStack {
                PestListScreen(pests: pests)
            }
            .tabItem {
                Label("Pests", systemImage: "ladybug")
            }
        }
        .task {
            do {
                let client = VegetableHTTPClient()
                vegetables = try await client.fetchVegetables()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    VegetableTabBarScreen()
        .modelContainer(previewContainer)
}

