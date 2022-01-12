//
//  CoinDetailedView.swift
//  Hodler
//
//  Created by Naji Achkar on 19/12/2021.
//

import SwiftUI

struct CoinDetailedView: View {
    
    let coin: Coin
    @State private var isChanged = false
    
    var body: some View {
        GeometryReader { geo in
        VStack {
            CoinHeaderView(coin: coin, size: 100, isChanged: $isChanged)
            ATHRow(coin: coin).frame(width: geo.size.width*0.9, height: geo.size.height*0.2)
        }
        }
    }
}

struct CoinDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        
        let coinsData: [Coin] = Bundle.main.decode("CoinsData.json")
 
        CoinDetailedView(coin: coinsData[0])
        
    }
}
