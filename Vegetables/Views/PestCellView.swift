//
//  PestCellView.swift
//  Vegetables
//
//  Created by Eric on 17/03/2025.
//

import SwiftUI

struct PestCellView: View {
    
    let pest: Pest
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            AsyncImage(url: pest.photo) { image in
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [.green.opacity(0.3), .blue.opacity(0.3)]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 85, height: 85)
                        .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 4)
                    
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 75, height: 75)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                }
            } placeholder: {
                ZStack {
                    Circle()
                        .fill(
                            RadialGradient(
                                gradient: Gradient(colors: [.gray.opacity(0.3), .gray.opacity(0.1)]),
                                center: .center,
                                startRadius: 10,
                                endRadius: 40
                            )
                        )
                        .frame(width: 85, height: 85)
                        .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 4)
                    
                    ProgressView()
                        .scaleEffect(1.2)
                        .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(pest.name)
                    .font(.headline)
                    .foregroundStyle(.primary)
                
                Text(pest.body)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }
        }
    }
}

#Preview(traits: .sampleData) {
    PestCellView(pest: PreviewData.loadPests()[0])
}
