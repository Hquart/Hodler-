//
//  StatService.swift
//  Hodler
//
//  Created by Naji Achkar on 05/01/2022.
//

import Foundation
import Combine

class MarketDataService: NetworkService {
    
    @Published var marketData: MarketDataModel? = nil
    
    var cancellable: AnyCancellable?
    private var baseURL = "https://api.coingecko.com/api/v3/global"
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    init() {
        getStats()
        debugPrint("StatsDataService INIT")
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func getStats() {
        cancellable = getData(baseURL: baseURL, parameters: nil)
            .receive(on: RunLoop.main)
            .decode(type: GlobalStats.self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                }
            }
    receiveValue: { [weak self] returnedData in
        self?.marketData = returnedData.data
            self?.cancellable?.cancel()
    }
    }
}

