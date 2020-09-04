//
//  AppCoordinatorTestCase.swift
//  WeatherAppTests
//
//  Created by Samar Khaled on 9/5/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import XCTest
@testable import WeatherApp

class AppCoordinatorTestCase: XCTestCase {

    var appCoordinator: AppCoordinator!
    override func setUpWithError() throws {
        appCoordinator = AppCoordinator(window: UIApplication.shared.windows.first!)
    }

    override func tearDownWithError() throws {
        appCoordinator = nil
    }

    func test_appCoordinator() throws {
        let sut = appCoordinator
        XCTAssertNotNil(sut)
        sut?.start()
        _ = try XCTUnwrap(sut?.rootViewController.topViewController as? WeatherSearchViewController)
    }
}
