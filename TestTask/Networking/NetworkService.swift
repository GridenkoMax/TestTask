//
//  NetworkService.swift
//  TestTask
//
//  Created by Maxim Gridenko on 20.01.2024.
//

import Foundation
class NetworkService {
    static let shared = NetworkService()
    private init(){}
    
    func getCountries() async throws -> [Country]{
        guard let url = URLManager.shared.createURL() else {
            throw NetworkError.badURL
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let jsonDecoder = JSONDecoder()
            let countriesResponse = try jsonDecoder.decode(CountriesResponse.self, from: data)
            return countriesResponse.result.data
        } catch {
            throw error
        }
    }
}
