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

    func test_pressingGoButton_withoutSearchText() throws {
        // swiftlint:disable line_length
        let goButton = app/*@START_MENU_TOKEN@*/.staticTexts["Go!"]/*[[".buttons[\"Go!\"].staticTexts[\"Go!\"]",".staticTexts[\"Go!\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        goButton.tap()
        let errorAlert = app.alerts["Error"].scrollViews.otherElements
        XCTAssert(errorAlert.staticTexts["Please enter a search input first"].exists)
        errorAlert.buttons["Ok"].tap()
    }

    func test_pressingGoButton_withValidSearchText() throws {
        app.textFields["Please enter a City/state/country/zipcode/etc"].tap()
        let cKey = app/*@START_MENU_TOKEN@*/.keys["C"]/*[[".keyboards.keys[\"C\"]",".keys[\"C\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        cKey.tap()
        let aKey = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey.tap()
        let iKey = app/*@START_MENU_TOKEN@*/.keys["i"]/*[[".keyboards.keys[\"i\"]",".keys[\"i\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        iKey.tap()
        let rKey = app/*@START_MENU_TOKEN@*/.keys["r"]/*[[".keyboards.keys[\"r\"]",".keys[\"r\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        rKey.tap()
        let oKey = app/*@START_MENU_TOKEN@*/.keys["o"]/*[[".keyboards.keys[\"o\"]",".keys[\"o\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        oKey.tap()
        XCTAssert(app.textFields["Cairo"].exists)
        let goButton = app/*@START_MENU_TOKEN@*/.staticTexts["Go!"]/*[[".buttons[\"Go!\"].staticTexts[\"Go!\"]",".staticTexts[\"Go!\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        goButton.tap()
        XCTAssertEqual(app.navigationBars["Cairo, EG"].staticTexts["Cairo, EG"].label, "Cairo, EG")
        app.navigationBars["Cairo, EG"].staticTexts["Cairo, EG"].tap()
    }

    func test_pressingGoButton_withInvalidSearchText() throws {
        app.textFields["Please enter a City/state/country/zipcode/etc"].tap()
        let moreKey = app/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"numbers\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey.tap()
        let key = app/*@START_MENU_TOKEN@*/.keys["4"]/*[[".keyboards.keys[\"4\"]",".keys[\"4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        let key2 = app/*@START_MENU_TOKEN@*/.keys["3"]/*[[".keyboards.keys[\"3\"]",".keys[\"3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
        let key3 = app/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key3.tap()
        app.buttons["Go!"].tap()
        let errorAlert = app.alerts["Error"].scrollViews.otherElements
        XCTAssert(errorAlert.staticTexts["Please enter a valid search input"].exists)
        errorAlert.buttons["Ok"].tap()
    }
}
