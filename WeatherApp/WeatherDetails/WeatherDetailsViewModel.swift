//
//  WeatherDetailsViewModel.swift
//  WeatherApp
//
//  Created by Samar Khaled on 9/4/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import Foundation

class WeatherDetailsViewModel {
    // MARK: - private var
    private var weatherData: Weather
    // MARK: - init
    init(weatherData: Weather) {
        self.weatherData = weatherData
    }
    // MARK: - Helper func
    func getCityName() -> String {
        return "\(weatherData.city.name), \(weatherData.city.country)"
    }

    func getWeatherData() -> Weather {
        weatherData
    }

    func getWeatherForecast() -> [WeatherForecast] {
        return weatherData.list
    }

    func refreshWeatherData(completion: @escaping(Result<Weather, WeatherSearchError>) -> Void) {
        let weatherSearch = WeatherSearchModel(userInput: weatherData.city.name)
        WeatherService().loadData(searchData: weatherSearch) { (result) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let weather):
                self.weatherData = weather
                completion(.success(weather))
            }
        }
    }
}
