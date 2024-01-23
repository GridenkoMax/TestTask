//
//  Validate.swift
//  TestTask
//
//  Created by Maxim Gridenko on 23.01.2024.
//

import Foundation

struct Validate {

    static func isValidPhoneNumber(_ number: String) -> Bool {
            let allowedCharacterSet = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: number)
            return allowedCharacterSet.isSuperset(of: characterSet) && number.count >= 10 && number.count <= 15
        }
    }
