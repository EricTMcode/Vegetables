//
//  AddNoteScreen.swift
//  Vegetables
//
//  Created by Eric on 11/03/2025.
//

import PhotosUI
import SwiftUI
import SwiftData

struct AddNoteScreen: View {

    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    let myGardenVegetable: MyGardenVegetable

    @State private var noteTitle: String = ""
    @State private var noteBody: String = ""

    @State private var selectedPhotoItem: PhotosPickerItem? = nil
    @State private var uiImage: UIImage?

    private func saveNote() {
        let note = Note(title: noteTitle, body: noteBody)
        myGardenVegetable.notes?.append(note)
        try? modelContext.save()
        dismiss()
    }

    var body: some View {
        Form {
            TextField("Title", text: $noteTitle)
            TextEditor(text: $noteBody)
                .frame(minHeight: 200)

            HStack(spacing: 20) {
                PhotosPicker(selection: $selectedPhotoItem, matching: .images, photoLibrary: .shared()) {
                    ZStack {
                        Circle()
                            .fill(.blue.opacity(0.2))
                            .frame(width: 60, height: 60)
                        Image(systemName: "photo.on.rectangle")
                            .font(.title)
                            .foregroundStyle(.blue)
                    }
                }
            }
            .buttonStyle(.borderless)
        }
        .task(id: selectedPhotoItem) {
            if let selectedPhotoItem {
                do {
                    if let data = try await selectedPhotoItem.loadTransferable(type: Data.self) {
                        uiImage = UIImage(data: data)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        .toolbar {
            
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }

            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    saveNote()
                }
            }
        }
    }
}

#Preview(traits: .sampleData) {

    @Previewable @Query var myGardenVegetables: [MyGardenVegetable]

    NavigationStack {
        AddNoteScreen(myGardenVegetable: myGardenVegetables[0])
    }
}
