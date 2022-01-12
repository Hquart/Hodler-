//
//  CoinLogo.swift
//  Hodler
//
//  Created by Naji Achkar on 14/12/21.
//

import SwiftUI

struct CoinLogo: View {
    
    @StateObject var viewModel: CoinLogoService
    
    init(coin: Coin) {
        _viewModel = StateObject(wrappedValue: CoinLogoService(coin: coin))
    }
    
    var body: some View {
        if let image = viewModel.image {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
        } else if viewModel.isLoading {
                ProgressView()
        } else {
            Image(systemName: "xmark.icloud.fill")
        }
    }
}


struct CoinLogo_Previews: PreviewProvider {
    static var previews: some View {
        let coinData: [Coin] = Bundle.main.decode("CoinsData.json")
        VStack {
            Text(coinData[9].name)
            CoinLogo(coin: coinData[9])
            
            Text("AsyncImage method:")
            AsyncImage(url: URL(string: "\(coinData[9].imageURL)")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
            }
        placeholder: {
            ProgressView()
        }
        }
    }
}
