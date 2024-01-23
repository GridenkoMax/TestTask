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
    
    func fetchCountries(completion: @escaping (Result<[Country], Error>) -> Void) {
        guard let url = URL(string: "https://api.cladda.kaerus.tech/directory/countries") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            do {
                let countriesResponse = try JSONDecoder().decode(CountriesResponse.self, from: data)
                completion(.success(countriesResponse.data))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
