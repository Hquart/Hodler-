//
//  athRow.swift
//  Hodler
//
//  Created by Naji Achkar on 27/12/2021.
//

import SwiftUI

struct ATHRow: View {
    
    var coin: Coin
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Way to all time high:")
                .font(.callout)
            HStack {
                ProgressView(value: coin.wayToATH, total: 100)
                    .progressViewStyle(LinearProgressViewStyle(tint: progressViewColor(input: coin.wayToATH)))
                    .frame(maxWidth: 150, maxHeight: 10)
                Text("\(coin.ath, specifier: "%.2f") $").font(.caption2).italic()
            }
            Text(coin.athDate).font(.caption2).italic()
        }
    }
    
    func progressViewColor(input: Double) -> Color {
        if input <= 25 {  return Color.red }
        if input <= 50 {  return Color.orange }
        if input <= 75 {  return Color.blue }
        return Color.green
    }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
struct ATHRow_Previews: PreviewProvider {
    
    static var previews: some View {
        let coinData: [Coin] = Bundle.main.decode("CoinsData.json")
        ATHRow(coin: coinData[0])
    }
}
