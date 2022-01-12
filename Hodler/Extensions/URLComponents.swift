//
//  URLComponents.swift
//  Hodler
//
//  Created by Naji Achkar on 08/12/21.
//

import Foundation

extension URLComponents {
    // This func will map [String: String] parameters to URLQueryItems
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
