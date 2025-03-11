//
//  VegetableTabBarScreen.swift
//  Vegetables
//
//  Created by Eric on 10/03/2025.
//

import SwiftUI

struct VegetableTabBarScreen: View {
    var body: some View {
        TabView {
            NavigationStack {
                VegetableListScreen()
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
                Text("Pests")
            }
            .tabItem {
                Label("Pests", systemImage: "ladybug")
            }
        }
    }
}

#Preview {
    VegetableTabBarScreen()
        .modelContainer(previewContainer)
}
