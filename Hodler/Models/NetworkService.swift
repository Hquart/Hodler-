//
//  APIService.swift
//  Hodler
//
//  Created by Naji Achkar on 30/12/2021.
//

import Foundation
import Combine

protocol NetworkService {
    
    var cancellable: AnyCancellable? { get set }
    func getData(baseURL: String, parameters: [String: String]?) -> AnyPublisher<Data, Error>
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
extension NetworkService {
    
    func getData(baseURL: String, parameters: [String: String]?) -> AnyPublisher<Data, Error> {
        guard var components = URLComponents(string: baseURL) else {  // Build URL:
            return Fail(error: APIError.URLComponentsError).eraseToAnyPublisher() }
        components.setQueryItems(with: parameters ?? [:])
        guard let url = components.url else {
            return Fail(error: APIError.URLComponentsError).eraseToAnyPublisher() }
        debugPrint("NETWORK CALL URL CHECK: \(url)")
        return URLSession.shared.dataTaskPublisher(for: url)  // Make network call:
            .tryMap ({ try handleURLResponse(output: $0, url: url) })   // Check response
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
                  throw APIError.serverResponseError(url: url)
              }
        return output.data
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print (error.localizedDescription)
        }
    }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
enum APIError: LocalizedError {
    
    case URLComponentsError
    case serverResponseError(url: URL)
    case decodeError
    
    var errorDescription: String? {
        switch self {
        case .URLComponentsError: return "There was a problem building URL with parameters"
        case .serverResponseError(url: let url): return "[😱] Bad reponse from URL: \(url)"
        case .decodeError: return "problem decoding the data"
        }
    }
}

    
    
    
    
    
    
    
    
    
    
    
    
    
    


