//
//  HarvestCountDownView.swift
//  Vegetables
//
//  Created by Eric on 11/03/2025.
//

import SwiftUI

struct HarvestCountDownView: View {

    let plantingDate: Date
    let harvestingDays: Int

    private var daysElapsed: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: plantingDate, to: Date())
        return max(components.day ?? 0, 0)
    }

    private var daysRemaining: Int {
        max(harvestingDays - daysElapsed, 0)
    }

    private var progress: CGFloat {
        CGFloat(daysElapsed) / CGFloat(harvestingDays)
    }

    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    .green.opacity(0.2),
                    style: StrokeStyle(lineWidth: 8, lineCap: .round)

                )

            Circle()
                .trim(from: 0, to: progress)
                .stroke (
                    .green,
                    style: StrokeStyle(lineWidth: 8, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.5), value: progress)

            VStack(spacing: 2) {
                Text("\(daysRemaining)")
                    .font(.caption)
                    .bold()
                    .foregroundStyle(.green)
                Text("Days")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    HarvestCountDownView(plantingDate: Date().daysAgo(60), harvestingDays: 90)
}
