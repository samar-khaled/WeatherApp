//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Samar Khaled on 9/3/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import Foundation

protocol WeatherData {
    func getCityData() -> CityData
    func getWeatherForecastData() -> [WeatherForecastData]
    func getTemperatureTextNow() -> String
    func getPressureTextNow() -> String
    func getHumidityTextNow() -> String
    func getDateTextNow() -> String
    func getCurrentConditionTextNow() -> String
    func getCurrentConditionImageTextNow() -> String?
}

protocol WeatherForecastData {
    func getTemperatureData() -> TemperatureData
    func getWeatherDetailsData() -> [WeatherDetailsData]
    func getDate() -> Date
    func getDateText() -> String
    func getPrecipitationText() -> String
    func getCurrentConditionText() -> String?
    func getCurrentConditionImageText() -> String?
}

protocol CityData {
    var name: String { get set }
    var country: String { get set }
    func getCoordinateData() -> CoordinateData
}

protocol CoordinateData {
    var lon: Double { get set }
    var lat: Double { get set }
}

protocol TemperatureData {
    func getTempatureText() -> String
    func getPressureText() -> String
    func getHumidityText() -> String
    func getFeelsLikeText() -> String
}

protocol WeatherDetailsData {
    func getCurrentCondition() -> String
    func getCurrentConditionImageName() -> String
}
