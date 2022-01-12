//
//  Statistics.swift
//  Hodler
//
//  Created by Naji Achkar on 05/01/2022.
//

import Foundation

// MARK: - Welcome
struct GlobalStats: Codable {
    let data: MarketDataModel?
}

// MARK: - DataClass
struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double

    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let output = totalMarketCap["usd"] {
            let formated = output.formatNumberWithAbbreviation()
            return "\(formated)"
        }
        return ""
    }
    
    var marketCapVariation: String {
        return marketCapChangePercentage24HUsd.asPercentString()
    }
    
    var volume: String {
        if let output = totalVolume["usd"] {
            let formated = output.formatNumberWithAbbreviation()
            return "\(formated)"
        }
        return ""
    }
    
    var btcDominance: String {
        if let output = marketCapPercentage["btc"] {
            return output.asPercentString()
        }
        return ""
    }
    
    var ethDominance: String {
        if let output = marketCapPercentage["eth"] {
            let formated = output.formatNumberWithAbbreviation()
            return "\(formated)"
        }
        return ""
    }
}

