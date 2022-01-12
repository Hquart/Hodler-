//
//  CoinModel.swift
//  Hodler
//
//  Created by Naji Achkar on 08/12/21.
//

import Foundation
import Combine
import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var stats: [StatisticsModel] = StatisticsModel.sample
//    @Published var coins = [Coin]()
    @Published var coins: [Coin] = Bundle.main.decode("CoinsData.json") // used for Previews
    @Published var portfolio = [Coin]()
    @Published var searchText: String = ""
    
    private let dataService = CoinsDataService()
    var cancellables = Set<AnyCancellable>()

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    init() {
        updateCoinsInfo()
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func updateCoinsInfo() {
        $searchText
            .combineLatest(dataService.$allCoins) // we subscribe to both searchText and coins
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main) // adds an interval at which new values are provided (better search bar experience)
            .map(filterCoins) // transforms the stream applying the filter function
            .sink { [weak self] (returnedCoins) in // handle the returned value (sink -> can't file, error type is Never
                self?.coins = returnedCoins
            }
            .store(in: &cancellables)
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    private func filterCoins(text: String, coins: [Coin]) -> [Coin] {
        guard !text.isEmpty else {
            return coins
        }
        let lowercasedText = text.lowercased() // any input is fully lowercased to simplify search
        
        return coins.filter { coin -> Bool in
            return coin.name.lowercased().contains(lowercasedText) ||
            coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
        }
    }
    
}
