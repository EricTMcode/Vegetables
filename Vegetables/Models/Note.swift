//
//  Note.swift
//  Vegetables
//
//  Created by Eric on 11/03/2025.
//

import Foundation
import SwiftData

@Model
class Note {
    var title: String
    var body: String
    var dateCreated: Date
    @Attribute(.externalStorage) var photo: Data? = nil

    var myGardenVegetable: MyGardenVegetable?

    init(title: String, body: String, dateCreated: Date, photo: Data? = nil, myGardenVegetable: MyGardenVegetable? = nil) {
        self.title = title
        self.body = body
        self.dateCreated = dateCreated
        self.photo = photo
        self.myGardenVegetable = myGardenVegetable
    }
}
