//
//  WeatherSearchViewModelTestCase.swift
//  WeatherAppTests
//
//  Created by Samar Khaled on 9/5/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import XCTest
@testable import WeatherApp

class WeatherSearchViewModelTestCase: XCTestCase {

    var sut: WeatherSearchViewModel!
    let timeout: TimeInterval = 5
    var expectation: XCTestExpectation!

    override func setUpWithError() throws {
        sut = WeatherSearchViewModel()
        expectation = expectation(description: "Search functionality")
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_searchEmptyUserInput() throws {
        sut.search(userInput: "") { (result) in
            defer { self.expectation.fulfill() }
            switch result {
            case .success(let data):
                XCTAssertNil(data)
            case .failure(let error):
                XCTAssertNotNil(error)
                XCTAssertEqual(error, WeatherSearchError.emptySearchInput)
            }
        }
        waitForExpectations(timeout: timeout)
    }

    func test_searchSuccess() throws {
        sut.search(userInput: "Cairo") { (result) in
            defer { self.expectation.fulfill() }
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
                XCTAssertEqual(data.city.name, "Cairo")
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
        waitForExpectations(timeout: timeout)
    }

    func test_searchFailed_invalidInput() throws {
        sut.search(userInput: "Ca123") { (result) in
            defer { self.expectation.fulfill() }
            switch result {
            case .success(let data):
                XCTAssertNil(data)
            case .failure(let error):
                XCTAssertNotNil(error)
                XCTAssertEqual(error, WeatherSearchError.invalidSearchInput)
            }
        }
        waitForExpectations(timeout: timeout)
    }

    func test_searchFailed_noData() throws {
        sut.search(userInput: "test") { (result) in
            defer { self.expectation.fulfill() }
            switch result {
            case .success(let data):
                XCTAssertNil(data)
            case .failure(let error):
                XCTAssertNotNil(error)
                XCTAssertEqual(error, WeatherSearchError.noDataFound)
            }
        }
        waitForExpectations(timeout: timeout)
    }
}
