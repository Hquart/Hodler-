//
//  StatisticsView.swift
//  Hodler
//
//  Created by Naji Achkar on 04/01/2022.
//

import SwiftUI

struct StatisticsBlock: View {
    
    let stat: StatisticsModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryTextColor)
            Text(stat.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(
                        Angle(degrees: (stat.variation ?? 0) >= 0 ? 0 : 180))
                
                Text(stat.variation?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundColor((stat.variation ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(stat.variation == nil ? 0.0 : 1.0)
        }
    }
}


struct StatisticsBlockView_Previews: PreviewProvider {
    static var previews: some View {
        let statSample = StatisticsModel(title: "Market Cap", value: "10 Bn", variation: 5.3)
        StatisticsBlock(stat: statSample)
    }
}
