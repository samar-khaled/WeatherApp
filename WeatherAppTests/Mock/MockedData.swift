//
//  MockedData.swift
//  WeatherAppTests
//
//  Created by Samar Khaled on 21/9/2020.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import Foundation
@testable import WeatherApp

class MockedData {
    static func getSuccessMockWeatherData() throws -> WeatherData {
        let data = try getSuccessMockedData()
        return try JSONDecoder().decode(Weather.self, from: data) as WeatherData
    }

    static func getSuccessMockedData() throws -> Data {
        let testBundle = Bundle(for: WeatherDetailsViewModelTestCase.self)
        let url = testBundle.url(forResource: "data", withExtension: "json")
        return try Data(contentsOf: url!)
    }
}
