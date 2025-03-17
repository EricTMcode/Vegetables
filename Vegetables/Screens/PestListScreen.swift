//
//  PestListScreen.swift
//  Vegetables
//
//  Created by Eric on 17/03/2025.
//

import SwiftUI

struct PestListScreen: View {

    let pests: [Pest]

    var body: some View {
        List(pests) { pest in
            Text(pest.name)

        }
    }
}

#Preview(traits: .sampleData) {
    PestListScreen(pests: PreviewData.loadPests())
}
