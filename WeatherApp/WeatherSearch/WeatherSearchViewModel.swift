//
//  WeatherSearchViewModel.swift
//  WeatherApp
//
//  Created by Samar Khaled on 9/3/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import Foundation

class WeatherSearchViewModel {
    func search(userInput: String, completion: @escaping(Result<Weather, WeatherSearchError>) -> Void) {
        guard !userInput.isEmpty else {
            completion(.failure(.emptySearchInput))
            return
        }
        let weatherSearch = WeatherSearchModel(userInput: userInput)
        if !weatherSearch.isCity() && !weatherSearch.isValidZipCode() {
            completion(.failure(.invalidSearchInput))
            return
        }
        WeatherService().loadData(searchData: weatherSearch) { (result) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let weather):
                completion(.success(weather))
            }
        }
    }
}
