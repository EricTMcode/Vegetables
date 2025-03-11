//
//  CircularAsyncImageView.swift
//  Vegetables
//
//  Created by Eric on 11/03/2025.
//

import SwiftUI

struct CircularAsyncImageView: View {

    let url: URL

    var body: some View {
        AsyncImage(url: url) { image in
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
                    .progressViewStyle(CircularProgressViewStyle())
                    .tint(.gray)
            }
        }
    }
}

#Preview {
    CircularAsyncImageView(url: URL(string: "https://www.azamsharp.com/images/carrot.png")!)
}
