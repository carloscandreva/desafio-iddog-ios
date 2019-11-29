//
//  BeerScreen.swift
//  genericAppForInterviewUITests
//
//  Created by Carlos Alberto Mota Candreva on 29/11/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import XCTest

class BeerScreen: BaseScreen {
    static var screen: XCUIElement {
        return XCUIApplication().otherElements["BeerScreen"]
    }
}
