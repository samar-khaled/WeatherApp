//
//  WeatherSearchViewModel.swift
//  WeatherApp
//
//  Created by Samar Khaled on 9/3/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import Foundation

class WeatherSearchViewModel {
    func search(userInput: String, completion: @escaping(Result<Int, WeatherSearchError>) -> Void) {
        guard !userInput.isEmpty else {
            completion(.failure(.emptySearchInput))
            return
        }
    }
}
