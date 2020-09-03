//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Samar Khaled on 9/3/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import XCTest
@testable import WeatherApp

class WeatherSearchTestCase: XCTestCase {

    let sut = WeatherSearchViewController()
    override func setUpWithError() throws {
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
    }

    func test_welcomeLabelDisplayed() throws {
        XCTAssertEqual(sut.welcomeLabel.text, "Welcome to the weather app")
    }

    func test_searchTextFieldDisplayed() throws {
        XCTAssertEqual(sut.searchTextField.placeholder, "Please enter a City/state/country/zipcode/etc")
    }

    func test_goButtonDisplayed() throws {
        XCTAssertEqual(sut.goButton.titleLabel?.text, "Go!")
    }
}
