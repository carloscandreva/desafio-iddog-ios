//
//  BaseTests.swift
//  genericAppForInterviewUITests
//
//  Created by Carlos Alberto Mota Candreva on 29/11/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import XCTest

class BaseTests: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        super.setUp()

        XCUIDevice.shared.orientation = .portrait
        continueAfterFailure = true
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
    }
}

