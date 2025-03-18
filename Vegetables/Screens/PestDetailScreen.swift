//
//  PestDetailScreen.swift
//  Vegetables
//
//  Created by Eric on 18/03/2025.
//

import SwiftUI

struct PestDetailScreen: View {

    let pest: Pest

    var body: some View {
        ScrollView {
            AsyncImage(url: pest.photo) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            } placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: 250)
            }
        }
    }
}

#Preview(traits: .sampleData) {
    PestDetailScreen(pest: PreviewData.loadPests()[0])
}
