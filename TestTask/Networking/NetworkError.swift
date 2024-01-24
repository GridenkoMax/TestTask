//
//  NetworkError.swift
//  TestTask
//
//  Created by Maxim Gridenko on 24.01.2024.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badRequest
    case badResponse
    case invalidDecoding
}
