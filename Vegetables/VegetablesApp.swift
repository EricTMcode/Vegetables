//
//  VegetablesApp.swift
//  Vegetables
//
//  Created by Eric on 10/03/2025.
//

import SwiftUI

@main
struct VegetablesApp: App {
    var body: some Scene {
        WindowGroup {
            VegetableTabBarScreen()
                .modelContainer(for: [Vegetable.self, MyGardenVegetable.self, Note.self])
        }
    }
}
