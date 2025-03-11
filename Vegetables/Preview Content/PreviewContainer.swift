//
//  PreviewContainer.swift
//  Vegetables
//
//  Created by Eric on 11/03/2025.
//

import Foundation
import SwiftData

let previewContainer: ModelContainer = {

    let container = try! ModelContainer(for: Vegetable.self, MyGardenVegetable.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    return container

}()
