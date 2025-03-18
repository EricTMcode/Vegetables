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
            SectionView(iconName: "info.circle", title: "Description", content: pest.body)
            SectionView(iconName: "exclamationmark.triangle", title: "Symptoms", content: pest.symptoms)
            SectionView(iconName: "bandage", title: "Treatment", content: pest.treatment)
        }
        .scrollIndicators(.hidden)
        .padding()
        .navigationTitle(pest.name)
    }
}

struct SectionView: View {
    let iconName: String
    let title: String
    let content: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: iconName)
                    .foregroundStyle(.blue)
                    .font(.title2)
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
            }

            Text(content)
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.leading)
        }
        .padding(.vertical, 8)
    }
}

#Preview(traits: .sampleData) {
    NavigationStack {
        PestDetailScreen(pest: PreviewData.loadPests()[0])
    }
}
