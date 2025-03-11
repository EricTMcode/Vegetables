//
//  MyGardenVegetable.swift
//  Vegetables
//
//  Created by Eric on 11/03/2025.
//

import Foundation
import SwiftData

@Model
class MyGardenVegetable {
    
    var vegetable: Vegetable
    var plantOption: PlantOption
    var datePlanted: Date = Date()

    init(vegetable: Vegetable, plantOption: PlantOption) {
        self.vegetable = vegetable
        self.plantOption = plantOption
    }
}
