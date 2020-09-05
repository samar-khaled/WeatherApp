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
    private var weatherData: WeatherData
    // MARK: - init
    init(weatherData: WeatherData) {
        self.weatherData = weatherData
    }
    // MARK: - Helper func
    func getCityName() -> String {
        return "\(weatherData.getCityData().name), \(weatherData.getCityData().country)"
    }

    func getWeatherData() -> WeatherData {
        weatherData
    }

    func getWeatherForecast() -> [WeatherForecastData] {
        return weatherData.getWeatherForecastData()
    }

    func refreshWeatherData(completion: @escaping(Result<Weather, WeatherSearchError>) -> Void) {
        let weatherSearch = WeatherSearchModel(userInput: weatherData.getCityData().name)
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
