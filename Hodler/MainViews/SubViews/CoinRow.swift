//
//  coinRow.swift
//  Hodler
//
//  Created by Naji Achkar on 07/12/21.
//

import SwiftUI

struct CoinRow: View {
    
    let coin: Coin
    
    var body: some View {
        GeometryReader { geo in
          
            HStack {
                    CoinLogo(coin: coin)
                    .frame(width: geo.size.width*0.14, alignment: .leading)
                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                 VStack(spacing: 8) {
                    HStack {
                        Text(coin.name)
                            .font(.body).bold().foregroundColor(Color.theme.mainText)
                        Spacer()
                        coin.currentPrice > 0.99 ?
                        Text("\(coin.currentPrice, specifier: "%.2f") $")
                            .font(.subheadline).bold().foregroundColor(Color.theme.mainText) :
                        Text("\(coin.currentPrice) $")
                            .font(.subheadline).bold().foregroundColor(Color.theme.mainText)
                    }
                     /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    HStack {
                        Text("\(coin.rank)")
                            .font(.caption2)
                            .foregroundColor(Color.black).bold()
                            .padding(3)
                            .background(Color.theme.lightGray)
                            .cornerRadius(3)
                        Text("\(coin.symbol)")
                            .font(.caption)
                            .foregroundColor(Color.theme.symbolColor)
                            .textCase(.uppercase)
                        Spacer()
                        Text("24h:")
                            .font(.caption2)
                            .foregroundColor(Color.gray)
                        Text("\(coin.rate24h, specifier: "%.2f") %")
                            .font(.footnote).bold()
                            .foregroundColor(coin.rate24h >= 0 ? Color.green : Color.red)
                        
                        
                   
                    }
                     /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    HStack {
                        Text("MCap:")
                            .font(.caption2)
                            .foregroundColor(Color.gray)
                        Text("\(coin.formatedCap)")
                            .font(.footnote)
                            .foregroundColor(Color.theme.blue)
                        Spacer()
                            .background(Color.theme.lightGray)
                            .cornerRadius(3)
                        Text ("ATH")
                            .font(.caption2)
                            .foregroundColor(Color.gray)
                        Text("\(coin.ath, specifier: "%.2f") $")
                            .font(.caption2)
                            .foregroundColor(Color.theme.blue)
                    }
                 }
                }
            }
        }
    }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
struct CoinRow_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let coinData: [Coin] = Bundle.main.decode("CoinsData.json")
        
        VStack {
            Spacer(minLength: 350)
            CoinRow(coin: coinData[0]).previewLayout(.sizeThatFits)
            Spacer(minLength: 200)
            CoinRow(coin: coinData[1]).previewLayout(.sizeThatFits)
            Spacer(minLength: 300)
        }
    }
}

