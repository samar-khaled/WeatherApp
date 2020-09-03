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
    var message: String {
        switch self {
        case .errorRetriveData:
            return "Failed to retrieve the weather data"
        case .emptySearchInput:
            return "Please enter a search input first"
        case .invalidSearchInput:
            return "Please enter a valid search input"
        }
    }
}
