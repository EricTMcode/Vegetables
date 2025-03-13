//
//  String+Extensions.swift
//  Vegetables
//
//  Created by Eric on 13/03/2025.
//

import Foundation

extension String {

    var isEmptyOrWhitespace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
