//
//  VegetableHTTPClient.swift
//  Vegetables
//
//  Created by Eric on 10/03/2025.
//

import Foundation

struct VegetableHTTPClient {

    func fetchVegetables() async throws -> [Vegetable] {
        let (data, _) = try await URLSession.shared.data(from: URL(string: "https://azamsharp.com/vegetables.json")!)
        return try JSONDecoder().decode([Vegetable].self, from: data)
    }
}
