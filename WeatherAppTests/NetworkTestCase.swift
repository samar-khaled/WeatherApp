//
//  NetworkTestCase.swift
//  WeatherAppTests
//
//  Created by Samar Khaled on 9/4/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import XCTest
@testable import WeatherApp

class NetworkTestCase: XCTestCase {
    let timeout: TimeInterval = 10
    var expectation: XCTestExpectation!
    var sut: WeatherService!
    override func setUpWithError() throws {
        expectation = expectation(description: "Server responds in reasonable time")
    }

    func test_weatherServiceSuccess() throws {
        let searchData = WeatherSearchModel(userInput: "London")
        let mockedNetwork = MockNetworking(mockedStatusCode: 200, mockedData: try MockedData.getSuccessMockedData())
        sut = WeatherService(network: mockedNetwork)
        sut.loadData(searchData: searchData) { (result) in
            defer { self.expectation.fulfill() }
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
        waitForExpectations(timeout: timeout)
    }

    func test_weatherServiceInvalidEndPoint() throws {
        let searchData = WeatherSearchModel(userInput: "co123")
        WeatherService().loadData(searchData: searchData) { (result) in
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

    func test_weatherServiceInvalidData() throws {
        let searchData = WeatherSearchModel(userInput: "12345")
        WeatherService().loadData(searchData: searchData) { (result) in
            defer { self.expectation.fulfill() }
            switch result {
            case .success(let data):
                XCTAssertNil(data)
            case .failure(let error):
                XCTAssertNotNil(error)
                XCTAssertEqual(error, WeatherSearchError.errorRetriveData)
            }
        }
        waitForExpectations(timeout: timeout)
    }

    func test_weatherServiceFailed_404() throws {
        let searchData = WeatherSearchModel(userInput: "L")
        WeatherService().loadData(searchData: searchData) { (result) in
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

    func test_weatherEndPointSuccess() throws {
        let endPoint: Endpoint = .weather(params: "q=london")
        let network = NetworkHandler()
        network.fetch(endPoint) { (result) in
            defer { self.expectation.fulfill() }
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
        waitForExpectations(timeout: timeout)
    }

    func test_weatherEndPointFailed_404() throws {
        let endPoint: Endpoint = .weather(params: "q=l")
        let network = NetworkHandler()
        network.fetch(endPoint) { (result) in
            defer { self.expectation.fulfill() }
            switch result {
            case .success(let data):
                XCTAssertNil(data)
            case .failure(let error):
                XCTAssertNotNil(error)
                XCTAssertEqual(error, NetworkError.network(statusCode: 404))
            }
        }
        waitForExpectations(timeout: timeout)
    }

    func test_weatherEndPointFailed_InvalidData() throws {
        let endPoint: Endpoint = .weather(params: "zip=12345")
        let network = NetworkHandler()
        network.fetch(endPoint) { (result) in
            defer { self.expectation.fulfill() }
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
                do {
                    _ = try JSONDecoder().decode(
                        Weather.self,
                        from: try XCTUnwrap(data)
                    )
                } catch {
                    switch error {
                    case DecodingError.keyNotFound(let key, _):
                        XCTAssertEqual(key.stringValue, "population")
                    default:
                        XCTFail("\(error)")
                    }
                }
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        }
        waitForExpectations(timeout: timeout)
    }
}
