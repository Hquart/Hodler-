//
//  CoinsDataService.swift
//  Hodler
//
//  Created by Naji Achkar on 02/01/2022.
//

import Foundation
import Combine

class CoinsDataService: NetworkService {

    @Published var allCoins: [Coin] = []
    
    var cancellable: AnyCancellable?
    private var baseURL = "https://api.coingecko.com/api/v3/coins/markets"
    private var parameters: [String: String] =
    ["vs_currency" : "usd",
     "per_page": "200",
     "page": "3",
      "order": "market_cap_desc"]

    init() {
        getCoinsData()
    }
    
    func getCoinsData() {
        cancellable = getData(baseURL: baseURL, parameters: parameters)
            .receive(on: DispatchQueue.main)
            .decode(type: [Coin].self, decoder: JSONDecoder())
            .catch { _ in
                Just(self.allCoins)
            }
            .sink(receiveValue: { data in
                self.allCoins = data
            })
    }
}

