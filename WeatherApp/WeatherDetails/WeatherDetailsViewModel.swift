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
    // MARK: Helper func
    func getCityName() -> String {
        return "\(weatherData.city.name), \(weatherData.city.country)"
    }
}
