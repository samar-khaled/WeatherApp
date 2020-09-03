//
//  WeatherSearch.swift
//  WeatherApp
//
//  Created by Samar Khaled on 9/3/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import Foundation

enum WeatherSearchError: Error {
    case emptySearchInput
    case invalidSearchInput
    case errorRetriveData
    case noDataFound
    var message: String {
        switch self {
        case .errorRetriveData:
            return "Failed to retrieve the weather data"
        case .emptySearchInput:
            return "Please enter a search input first"
        case .invalidSearchInput:
            return "Please enter a valid search input"
        case .noDataFound:
            return "City is not found"
        }
    }
}

struct WeatherSearchModel {
    var userInput: String

    func isCity() -> Bool {
        let numberRegEx  = ".*[0-9]+.*"
        let testCase = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
        return !testCase.evaluate(with: userInput)
    }

    func isValidZipCode() -> Bool {
        let postalcodeRegex = "^[0-9]{5}(-[0-9]{4})?$"
        let pinPredicate = NSPredicate(format: "SELF MATCHES %@", postalcodeRegex)
        return pinPredicate.evaluate(with: userInput) as Bool
    }
}
