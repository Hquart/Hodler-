//
//  CoinHeaderView.swift
//  Hodler
//
//  Created by Naji Achkar on 26/12/2021.
//

import SwiftUI

struct CoinHeaderView: View {
    
    var coin: Coin
    var size: CGFloat

    @Binding var isChanged: Bool
    @Namespace var namespace
    
    var body: some View {
        VStack {
            if !isChanged {
                VStack(spacing: 10) {
                   CoinLogo(coin: coin)
                            .matchedGeometryEffect(id: "rectangle", in: namespace)
                            .frame(width: size, height: size)
                    Text(coin.name)
                        .matchedGeometryEffect(id: "title", in: namespace)
                        .font(Font.title.bold())
                    Text(coin.symbol.uppercased()).bold()
                        .matchedGeometryEffect(id: "rank", in: namespace)
                }
            }
            if isChanged {
                HStack(spacing: 10) {
                    CoinLogo(coin: coin)
                             .matchedGeometryEffect(id: "rectangle", in: namespace)
                             .frame(width: size, height: size)
                    Text(coin.name)
                        .matchedGeometryEffect(id: "title", in: namespace)
                        .font(Font.title.bold())
                    Text(coin.symbol.uppercased()).bold()
                        .matchedGeometryEffect(id: "rank", in: namespace)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.3)
    }
}

struct CoinHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        
        let coinData: [Coin] = Bundle.main.decode("CoinsData.json")
        
        CoinHeaderView(coin: coinData[0], size: 100, isChanged: .constant(false))
    }
}
