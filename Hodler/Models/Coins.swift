//
//  Coin.swift
//  Hodler
//
//  Created by Naji Achkar on 07/12/21.
//

import Foundation
import SwiftUI


struct Coin: Identifiable, Codable  {
    
    let id: String
    let symbol: String
    let name: String
    let imageURL: String
    let rank: Int
    let rate24h: Double
    let currentPrice: Double
    let ath: Double
    let athDate: String
    let cap: Double
    let sparklineIn7D: SparkLineIn7D?
    
    struct SparkLineIn7D: Codable {
        let price: [Double]?
    }
    
    var formatedCap: String {
        return formatNumber(n: cap)
    }
    var formatedPrice: String {
        return formatNumber(n: currentPrice)
    }
    var wayToATH: Double {
        return currentPrice/ath * 100
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case symbol = "symbol"
        case name = "name"
        case imageURL = "image"
        case rank = "market_cap_rank"
        case rate24h = "price_change_percentage_24h"
        case currentPrice = "current_price"
        case ath = "ath"
        case athDate = "ath_date"
        case cap =  "market_cap"
        case sparklineIn7D = "sparkline_in_7d"
        
    }
    
    func formatNumber(n: Double) -> String {
        let num = n
        switch num {
        case 1_000_000_000...:
            var formatted = num / 1_000_000_000
            formatted = formatted.reduceScale(to: 1)
            return "\(formatted) B"
        case 1_000_000...:
            var formatted = num / 1_000_000
            formatted = formatted.reduceScale(to: 1)
            return "\(formatted)M"
        case 1_000...:
            var formatted = num / 1_000
            formatted = formatted.reduceScale(to: 1)
            return "\(formatted)K"
        case 1...:
            return "\(n)"
        default:
            return "\(n)"
        }
    }
}



//    let formatedATHDate: String {
//        let string = athDate
//        let dateFormatter = DateFormatter()
//        guard let date = dateFormatter.date(from: string) else {
//            debugPrint("date issue")
//            return string
//        }
//        dateFormatter.dateFormat = "YY/MM/dd"
//        dateFormatter.locale = Locale(identifier: "fr")
//        return dateFormatter.string(from: date)
//    }

   
    

    
    
    
    
    
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////








// MARK: - WelcomeElement
//struct WelcomeElement: Codable {
//    let id, symbol, name: String
//    let image: String
//    let currentPrice: Double
//    let marketCap, marketCapRank: Int
//    let fullyDilutedValuation: Int?
//    let totalVolume: Int
//    let high24H, low24H, priceChange24H, priceChangePercentage24H: Double
//    let marketCapChange24H, marketCapChangePercentage24H, circulatingSupply: Double
//    let totalSupply, maxSupply: Int?
//    let ath, athChangePercentage: Double
//    let athDate: String
//    let atl, atlChangePercentage: Double
//    let atlDate: String
//    let roi: Roi?
//    let lastUpdated: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, symbol, name, image
//        case currentPrice = "current_price"
//        case marketCap = "market_cap"
//        case marketCapRank = "market_cap_rank"
//        case fullyDilutedValuation = "fully_diluted_valuation"
//        case totalVolume = "total_volume"
//        case high24H = "high_24h"
//        case low24H = "low_24h"
//        case priceChange24H = "price_change_24h"
//        case priceChangePercentage24H = "price_change_percentage_24h"
//        case marketCapChange24H = "market_cap_change_24h"
//        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
//        case circulatingSupply = "circulating_supply"
//        case totalSupply = "total_supply"
//        case maxSupply = "max_supply"
//        case ath
//        case athChangePercentage = "ath_change_percentage"
//        case athDate = "ath_date"
//        case atl
//        case atlChangePercentage = "atl_change_percentage"
//        case atlDate = "atl_date"
//        case roi
//        case lastUpdated = "last_updated"
//    }
//}
//
//// MARK: - Roi
//struct Roi: Codable {
//    let times: Double
//    let currency: String
//    let percentage: Double
//}
//
//typealias Welcome = [WelcomeElement]
