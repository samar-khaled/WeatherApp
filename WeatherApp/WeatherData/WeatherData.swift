//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Samar Khaled on 9/3/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import Foundation

// swiftlint:disable identifier_name
struct Weather: Decodable, Equatable {
    var city: City
    var cod: String
    var message: Double
    var cnt: Int
    var list: [WeatherForecast]
}

struct City: Decodable, Equatable {
    var name: String
    var coord: Coordinate
    var country: String
    var population: Int
    var timezone: Int
    var sunrise: Int
    var sunset: Int

    func getSunriseDate() -> Date {
        Date(timeIntervalSince1970: TimeInterval(sunrise))
    }

    func getSunsetDate() -> Date {
        Date(timeIntervalSince1970: TimeInterval(sunset))
    }
}

struct Coordinate: Decodable, Equatable {
    var lon: Double
    var lat: Double
}

struct WeatherForecast: Decodable, Equatable {
    var dt: Int
    var main: Temperature
    var weather: [WeatherDetails]
    var clouds: Clouds
    var wind: Wind
    var visibility: Int
    var pop: Double
    var rain: [String: Double]?
    func getDate() -> Date {
        Date(timeIntervalSince1970: TimeInterval(dt))
    }
}

struct Temperature: Decodable, Equatable {
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Int
    var sea_level: Int
    var grnd_level: Int
    var humidity: Int
    var temp_kf: Double
}

struct WeatherDetails: Decodable, Equatable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct Clouds: Decodable, Equatable {
    var all: Int
}

struct Wind: Decodable, Equatable {
    var deg: Int
    var speed: Double
    var gust: Int?
}
