//
//  BeerListScreen.swift
//  genericAppForInterviewUITests
//
//  Created by Carlos Alberto Mota Candreva on 29/11/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import XCTest

class BeerListScreen: BaseScreen {
    private struct ElementsIds {
        static let visibleBeerLoadText = "Buzz"
        static let notVisibleBeerLoadText = "Bramling X"
    }

    static var screen: XCUIElement {
        return XCUIApplication().collectionViews["BeerListScreen"]
    }

    static func visibleBeerCell() -> XCUIElement {
        return screen.cells.containing(.staticText, identifier: ElementsIds.visibleBeerLoadText).firstMatch
    }

    static func notVisibleBeerCell() -> XCUIElement {
        return screen.cells.containing(.staticText, identifier: ElementsIds.notVisibleBeerLoadText).firstMatch
    }
}
