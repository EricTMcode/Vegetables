//
//  Date+Extensions.swift
//  Vegetables
//
//  Created by Eric on 11/03/2025.
//

import Foundation

extension Date {

    func daysAgo(_ days: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: -days, to: self) ?? self
    }

}
