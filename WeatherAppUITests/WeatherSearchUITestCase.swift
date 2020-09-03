//
//  WeatherAppUITests.swift
//  WeatherAppUITests
//
//  Created by Samar Khaled on 9/3/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import XCTest

class WeatherSearchUITestCase: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func test_pressingGoButtonWithoutSearchText() throws {
        // swiftlint:disable line_length
        let goButton = app/*@START_MENU_TOKEN@*/.staticTexts["Go!"]/*[[".buttons[\"Go!\"].staticTexts[\"Go!\"]",".staticTexts[\"Go!\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        goButton.tap()
        let errorAlert = app.alerts["Error"].scrollViews.otherElements
        XCTAssert(errorAlert.staticTexts["Please enter a search input first"].exists)
        errorAlert.buttons["Ok"].tap()
    }
}
