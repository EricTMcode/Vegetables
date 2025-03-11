//
//  SeedOrSeedlingView.swift
//  Vegetables
//
//  Created by Eric on 11/03/2025.
//

import SwiftUI

enum PlantOption: Codable {
    case seed
    case seedling

    var title: String {
        switch self {
        case .seed:
            return "Seed"
        case .seedling:
            return "Seedling"
        }
    }

    var icon: String {
        switch self {
        case .seed:
            return "leaf.fill"
        case .seedling:
            return "leaf.arrow.circlepath"
        }
    }
}

struct SeedOrSeedlingView: View {

    @Environment(\.dismiss) private var dismiss
    let onSelected: (PlantOption) -> Void

    var body: some View {
        VStack {
            Text("Choose an Option")
                .font(.headline)

            HStack(spacing: 24) {
                OptionView(option: .seed) { option in
                    onSelected(option)
                    dismiss()
                }
                OptionView(option: .seedling) { option in
                    onSelected(option)
                    dismiss()
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
        .padding()
    }
}

struct OptionView: View {
    let option: PlantOption
    let action: (PlantOption) -> Void

    var body: some View {
        Button {
            action(option)
        } label: {
            HStack(spacing: 8) {
                Image(systemName: option.icon)
                    .foregroundStyle(.green)
                Text(option.title)
                    .font(.subheadline)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
        }
    }
}

#Preview {
    SeedOrSeedlingView(onSelected: { _ in })
}
