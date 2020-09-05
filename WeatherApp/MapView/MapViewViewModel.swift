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
    private var weatherData: WeatherData

    // MARK: - init
    init(weatherData: WeatherData) {
        self.weatherData = weatherData
    }

    // MARK: - func
    func getCityCLLocation() -> CLLocation {
        CLLocation(
            latitude: weatherData.getCityData().getCoordinateData().lat,
            longitude: weatherData.getCityData().getCoordinateData().lon
        )
    }

    func getTemeratureSummary() -> String {
        "Now \(weatherData.getTemperatureTextNow()) - \(weatherData.getCurrentConditionTextNow())"
    }
}
