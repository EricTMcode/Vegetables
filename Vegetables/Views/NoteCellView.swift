//
//  NoteCellView.swift
//  Vegetables
//
//  Created by Eric on 13/03/2025.
//

import SwiftUI
import SwiftData

struct NoteCellView: View {

    let note: Note
    let placeHolderImage: URL?

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
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

                if let photoData = note.photo,
                   let uiImage = UIImage(data: photoData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 75, height: 75)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                } else {
                    AsyncImage(url: placeHolderImage) { image in
                        image
                            .resizable()
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                    }
                    .scaledToFill()
                    .frame(width: 75, height: 75)
                    .clipShape(Circle())
                    .foregroundStyle(.gray)
                    .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                }
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(note.title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text(note.body)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
                Text(note.dateCreated, format: .dateTime)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview(traits: .sampleData) {

    @Previewable @Query var notes: [Note]

    NoteCellView(note: notes[0], placeHolderImage: URL(string: "https://www.azamsharp.com/images/carrot.png"))
}
