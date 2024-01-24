//
//  URLManager.swift
//  TestTask
//
//  Created by Maxim Gridenko on 24.01.2024.
//

import Foundation

class URLManager {
    static let shared = URLManager()
    private init(){}
    
    private let tunnel = "https://"
    private let server = "api.cladda.kaerus.tech"
    private let endpoint = "/directory/countries"
    
    func createURL() -> URL? {
        let str = tunnel + server + endpoint
        let url = URL(string: str)
        return url
    }
}
