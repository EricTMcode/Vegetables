//
//  VegetableDetailScreen.swift
//  Vegetables
//
//  Created by Eric on 10/03/2025.
//

import SwiftUI

struct VegetableDetailScreen: View {
    
    let vegetable: Vegetable
    
    var body: some View {
        ScrollView {
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
        }
    }
}

#Preview {
    VegetableDetailScreen(vegetable: PreviewData.loadVegetables()[0])
}
