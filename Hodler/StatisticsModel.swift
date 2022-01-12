//
//  StatisticsModel.swift
//  Hodler
//
//  Created by Naji Achkar on 04/01/2022.
//

import Foundation

struct StatisticsModel: Identifiable {
    
    let id = UUID().uuidString
    let title: String
    let value: String
    let variation: Double?
    
    init(title: String, value: String, variation: Double? = nil) {
        self.title = title
        self.value = value
        self.variation = variation
    }
    
    static var sample = [StatisticsModel(title: "Market Cap", value: "1000", variation: 3.8),
                         StatisticsModel(title: "Prices", value: "200", variation: 5.2),
                         StatisticsModel(title: "Other", value: "29872", variation: -7.9),
                         StatisticsModel(title: "Portfolio", value: "2507882", variation: 2.6)
    ]
}
