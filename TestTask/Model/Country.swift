//
//  Country.swift
//  TestTask
//
//  Created by Maxim Gridenko on 20.01.2024.
//

import Foundation

struct Country: Codable {
    var id: Int
    var title: String
    var code: String
    var flagUrl: String
    var phoneCode: String
    var phoneMasks: [String]
}

struct CountriesResponse: Codable {
    var data: [Country]
}
