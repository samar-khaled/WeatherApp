//
//  WeatherSearchModelTestCase.swift
//  WeatherAppTests
//
//  Created by Samar Khaled on 9/4/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import XCTest
@testable import WeatherApp

class WeatherSearchModelTestCase: XCTestCase {

    func test_validCityString() {
        let sut = WeatherSearchModel(userInput: "test")
        XCTAssert(sut.isCity())
    }

    func test_inValidCityString() {
        let sut = WeatherSearchModel(userInput: "12345")
        XCTAssertFalse(sut.isCity())
    }

    func test_validZipCodeString() {
        let sut = WeatherSearchModel(userInput: "12345")
        XCTAssert(sut.isValidZipCode())
    }

    func test_errorMessage() {
        XCTAssertEqual(WeatherSearchError.emptySearchInput.message, "Please enter a search input first")
        XCTAssertEqual(WeatherSearchError.errorRetriveData.message, "Failed to retrieve the weather data")
        XCTAssertEqual(WeatherSearchError.invalidSearchInput.message, "Please enter a valid search input")
        XCTAssertEqual(WeatherSearchError.noDataFound.message, "City is not found")
    }
}
