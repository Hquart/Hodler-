//
//  HomeStatsViewModel.swift
//  Hodler
//
//  Created by Naji Achkar on 05/01/2022.
//

import Foundation
import Combine

class HomeStatsViewModel: ObservableObject {
    
    @Published var allStats: [StatisticsModel] = []
    
    private var marketDataService = MarketDataService()
    private var cancellables = Set<AnyCancellable>()
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    init() {
        updateMarketData()
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func updateMarketData() {
        marketDataService.$marketData
            .map(mapGlobalMarketData)
            .sink { [weak self] returnedArray in
                self?.allStats = returnedArray
    }
            .store(in: &cancellables)
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func mapGlobalMarketData(data: MarketDataModel?) -> [StatisticsModel] {
        var stats: [StatisticsModel] = []
        guard let data = data else { return stats }
        let marketCap = StatisticsModel(title: "Market Cap", value: data.marketCap, variation: data.marketCapChangePercentage24HUsd)
        let volume = StatisticsModel(title: "Volume", value: data.volume, variation: nil)
        let btcDominance = StatisticsModel(title: "BTC Dominance", value: data.btcDominance, variation: nil)
        stats.append(contentsOf: [marketCap , volume, btcDominance])
        return stats
    }
}
