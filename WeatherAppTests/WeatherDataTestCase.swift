//
//  WeatherDataTestCase.swift
//  WeatherAppTests
//
//  Created by Samar Khaled on 9/4/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import XCTest
@testable import WeatherApp

class WeatherDataTestCase: XCTestCase {
    func test_decodingWeatherData() throws {
        let data: Data

        let testBundle = Bundle(for: WeatherDataTestCase.self)
        let url = try XCTUnwrap(
            testBundle.url(forResource: "data", withExtension: "json")
        )
        data = try XCTUnwrap( try Data(contentsOf: url))
        let sut = try JSONDecoder().decode(Weather.self, from: data)
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.city.name, "London")
        XCTAssertNotNil(sut.city.getSunriseDate() as Date)
        XCTAssertNotNil(sut.city.getSunsetDate() as Date)
        XCTAssertNotNil(sut.list)
        XCTAssert(sut.list.count > 0)
        XCTAssertNotNil(sut.list.first?.weather)
        XCTAssertNotNil((sut.list.first?.getDate())! as Date)
    }
}
