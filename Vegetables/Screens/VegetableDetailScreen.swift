//
//  VegetableDetailScreen.swift
//  Vegetables
//
//  Created by Eric on 10/03/2025.
//

import SwiftUI
import SwiftData

struct VegetableDetailScreen: View {

    @Environment(\.modelContext) private var modelContext
    let vegetable: Vegetable

    @State private var showSeedOrSeedlingMenu = false

    private func saveVegetableToMyGarden(with plantOption: PlantOption) {
        let myGardenVegetable = MyGardenVegetable(vegetable: vegetable, plantOption: plantOption)
        modelContext.insert(myGardenVegetable)
        do {
            try modelContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: vegetable.thumbnailImage) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(16)
                        .shadow(radius: 10)

                } placeholder: {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.gray.opacity(0.3))
                        .frame(height: 200)
                        .overlay {
                            ProgressView()
                                .scaleEffect(1.5)
                                .progressViewStyle(CircularProgressViewStyle())
                                .tint(.gray)
                        }
                }
                .frame(maxWidth: .infinity, maxHeight: 300)
                .padding(.bottom, 8)

                Text(vegetable.body)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .lineSpacing(4)
                    .padding(.bottom, 8)

                Divider()

                Text("Quick Facts")
                    .font(.title2)
                    .bold()

                DetailRow(icon: "leaf", title: "Seed Depth", value: vegetable.seedDepth)
                DetailRow(icon: "thermometer", title: "Germination Temp", value: vegetable.germinationSoilTemp)
                DetailRow(icon: "calendar", title: "Days to Germimation", value: "\(vegetable.daysToGermination) days")
                DetailRow(icon: "sun.max", title: "Light Requirement", value: vegetable.light)
                DetailRow(icon: "drop", title: "Watering", value: vegetable.watering)
                DetailRow(icon: "leaf.arrow.triangle.circlepath", title: "Companions", value: vegetable.goodCompanions)
                DetailRow(icon: "exclamationmark.triangle", title: "Bad Companions", value: vegetable.badCompanions)
                DetailRow(icon: "heart.fill", title: "Health Benefits", value: vegetable.healthBenefits.isEmpty ? "N/A" : vegetable.healthBenefits)

                if let pests = vegetable.pests {
                    DetailRow(icon: "ladybug", title: "Pests", value: pests.isEmpty ? "N/A" : pests.map { $0.name }.joined(separator: ", "))
                }

                Divider()

                SectionHeader(title: "Growing Tips")

                Text(vegetable.growingDescription)
                    .font(.body)
                    .foregroundStyle(.secondary)

                SectionHeader(title: "Harvest Tips")

                Text(vegetable.harvestDescription)
                    .font(.body)
                    .foregroundStyle(.secondary)


            }
            .padding()
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showSeedOrSeedlingMenu = true
                } label: {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundStyle(.green)
                }
            }
        }
        .sheet(isPresented: $showSeedOrSeedlingMenu) {
            SeedOrSeedlingView { option in
                saveVegetableToMyGarden(with: option)
            }
            .presentationDetents([.fraction(0.20)])
            .presentationBackground(Color(.systemGray6))
        }
        .navigationTitle(vegetable.name)
    }
}

struct SectionHeader: View {

    let title: String

    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundStyle(.primary)
            .padding(.top)
    }
}

struct DetailRow: View {

    let icon: String
    let title: String
    let value: String

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .foregroundStyle(.green)
                .frame(width: 24, height: 24)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Text(value)
                    .font(.body)
                    .foregroundStyle(.primary)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview(traits: .sampleData) {
    NavigationStack {
        VegetableDetailScreen(vegetable: PreviewData.loadVegetables()[0])
    }
}
