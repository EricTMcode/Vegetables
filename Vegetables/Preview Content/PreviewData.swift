//
//  PreviewData.swift
//  Vegetables
//
//  Created by Eric on 10/03/2025.
//

import Foundation

struct PreviewData {

    static func loadVegetables() -> [Vegetable] {

        guard let url = Bundle.main.url(forResource: "vegetables", withExtension: "json") else {
            return []
        }

        do {
            let data = try Data(contentsOf: url)
            let vegetables = try JSONDecoder().decode([Vegetable].self, from: data)
            return vegetables
        } catch {
            return []
        }
    }
}
