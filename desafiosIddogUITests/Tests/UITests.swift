//
//  UITests.swift
//  genericAppForInterviewUITests
//
//  Created by Carlos Alberto Mota Candreva on 29/11/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import XCTest

class UITests: BaseTests {

    override func setUp() {
        super.setUp()
        BeerListScreen.waitScreen(testCase: self)
    }

    func testCollectionDidLoad() {
        waitElementExists(element: BeerListScreen.visibleBeerCell())
    }

    func testDetails() {
        let cell = BeerListScreen.notVisibleBeerCell()
        waitElementExists(element: cell, scrollElement: BeerListScreen.screen, timeout: 2)
        cell.tap()
        BeerScreen.waitScreen(testCase: self)
        BeerScreen.tapNavigationBackButton()
        BeerListScreen.waitScreen(testCase: self)
    }

    func testCollectionRefresh() {
        let cell = BeerListScreen.visibleBeerCell()
        let screen = BeerListScreen.screen

        let start = cell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let finish = cell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 2.5))
        start.press(forDuration: 0, thenDragTo: finish)

        waitElementExists(element: cell, scrollElement: screen)
    }
}
