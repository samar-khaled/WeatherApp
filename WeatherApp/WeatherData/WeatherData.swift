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

    func getTemperatureTextNow() -> String {
        return list.first?.main.getTempatureText() ?? "0°"
    }

    func getPressureTextNow() -> String {
        return list.first?.main.getPressureText() ?? "0 hPa"
    }

    func getHumidityTextNow() -> String {
        return list.first?.main.getHumidityText() ?? "0%"
    }

    func getDateTextNow() -> String {
        let date = list.first?.getDate() ?? Date()
        return "as of \(DateFormatter.localizedString(from: date, dateStyle: .none, timeStyle: .long))"
    }

    func getCurrentConditionTextNow() -> String {
        return list.first?.weather.first?.main ?? ""
    }

    func getCurrentConditionImageTextNow() -> String? {
        return list.first?.weather.first?.icon
    }
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
        Date(timeIntervalSince1970: TimeInterval(sunrise) + Double(timezone))
    }

    func getSunsetDate() -> Date {
        Date(timeIntervalSince1970: TimeInterval(sunset) + Double(timezone))
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
    var dt_txt: String
    func getDate() -> Date {
        Date(timeIntervalSince1970: TimeInterval(dt))
    }

    func getDateText() -> String {
        let date = getDate()
        return DateFormatter.localizedString(from: date, dateStyle: .short, timeStyle: .short)
    }

    func getPrecipitationText() -> String {
        return "\(pop) cm"
    }

    func getCurrentConditionText() -> String? {
        return weather.first?.main
    }

    func getCurrentConditionImageText() -> String? {
        return weather.first?.icon
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

    func getTempatureText() -> String {
        return "\(temp)" + "°"
    }

    func getPressureText() -> String {
        return "\(pressure)" + " hPa"
    }

    func getHumidityText() -> String {
        return "\(humidity)" + "%"
    }

    func getFeelsLikeText() -> String {
        return "\(feels_like)" + "°"
    }
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
