//
//  CoinService2.swift
//  Hodler
//
//  Created by Naji Achkar on 22/12/2021.
//

import Foundation

class CoinsService2: ObservableObject {
    
    @Published var coins = [Coin]()
    
    // Preview purpose
//    @Published var coins: [Coin] = Bundle.main.decode("CoinsData.json")
    
    private var baseURL = "https://api.coingecko.com/api/v3/coins/markets"
    
    private var parameters: [String: String] =
    [ "vs_currency" : "usd",
      "order": "market_cap_desc"]
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func buildURL(baseURL: String, parameters: [String: String]) throws -> URL {
        guard var components = URLComponents(string: baseURL) else {
            throw URLError(.badURL) }
        components.setQueryItems(with: parameters)
        guard let url = components.url else {
            throw URLError(.badURL) }
        return url
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func getCoinsData() async throws -> [Coin] {
      let request  = try URLRequest(url: buildURL(baseURL: baseURL, parameters: parameters))
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse) }
        let decodedData =  try JSONDecoder().decode([Coin].self, from: data)
        return decodedData
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func updateCoinsInfo() async throws {
        Task.init {
            do { self.coins = try await getCoinsData()
                    
            } catch {   print(error.localizedDescription)
            }
        }
    }
}
    
// TO USE THIS SERVICE IN A VIEW:
//    .task {
//        do { try await coinsService.updateCoinsInfo() }
//        catch { print("Error", error) }
//    }
