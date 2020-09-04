//
//  MapViewViewModel.swift
//  WeatherApp
//
//  Created by Samar Khaled on 9/4/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import Foundation
import MapKit

class MapViewViewModel {
    // MARK: - private var
    private var weatherData: Weather

    // MARK: - init
    init(weatherData: Weather) {
        self.weatherData = weatherData
    }

    // MARK: - func
    func getCityCLLocation() -> CLLocation {
        CLLocation(latitude: weatherData.city.coord.lat, longitude: weatherData.city.coord.lon)
    }

    func getTemeratureSummary() -> String {
        "Now \(weatherData.getTemperatureTextNow()) - \(weatherData.getCurrentConditionTextNow())"
    }
}
