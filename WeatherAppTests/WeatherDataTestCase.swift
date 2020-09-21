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
        let data =  try XCTUnwrap( MockedData.getSuccessMockedData() )
        let sut = try JSONDecoder().decode(Weather.self, from: data)
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.city.name, "London")
        XCTAssertEqual(sut.city.country, "GB")
        XCTAssertNotNil(sut.city.getSunriseDate() as Date)
        XCTAssertNotNil(sut.city.getSunsetDate() as Date)
        XCTAssertNotNil(sut.city.coord)
        XCTAssertEqual(sut.getDateTextNow(), "Thursday 9/3/20, 11:00 PM")
        XCTAssertEqual(sut.getHumidityTextNow(), "67%")
        XCTAssertEqual(sut.getPressureTextNow(), "1018 hPa")
        XCTAssertEqual(sut.getTemperatureTextNow(), "63.03°")
        XCTAssertEqual(sut.getCurrentConditionTextNow(), "Clouds")
        XCTAssertEqual(sut.getCurrentConditionImageTextNow(), "04n")

        XCTAssertNotNil(sut.list)
        XCTAssert(sut.list.count > 0)
        let sutList = sut.list.first
        XCTAssertNotNil(sutList)
        XCTAssertNotNil(sutList?.weather)
        XCTAssertNotNil((sutList?.getDate())! as Date)
        XCTAssertEqual(sutList?.getDateText(), "9/3/20, 11:00 PM")
        XCTAssertEqual(sutList?.getPrecipitationText(), "0.0 cm")
        XCTAssertEqual(sutList?.getCurrentConditionText(), "Clouds")
        XCTAssertEqual(sutList?.getCurrentConditionImageText(), "04n")
    }
}
