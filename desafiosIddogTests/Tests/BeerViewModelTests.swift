//
//  BeerViewModelTests.swift
//  genericAppForInterviewTests
//
//  Created by Carlos Alberto Mota Candreva on 29/11/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import XCTest
@testable import genericAppForInterview

class BeerViewModelTests: BaseTests {

    func testViewModelInit() {
        //Arrange
        let beer = Beer(id: 12,
                        imageURL: "image url",
                        name: "name",
                        tagline: "tagline",
                        alcoholByVolume: 20,
                        internationalBitternessUnits: 10,
                        description: "description")

        //Act
        let vm = BeerViewModel(beer)

        //Assert
        XCTAssertEqual(vm.id, beer.id)
        XCTAssertEqual(vm.imageURL, beer.imageURL)
        XCTAssertEqual(vm.name, beer.name)
        XCTAssertEqual(vm.tagline, beer.tagline)
        XCTAssertEqual(vm.abvString, "abv 20.0%")
        XCTAssertEqual(vm.ibuString, "ibu 10.0")
        XCTAssertEqual(vm.description, beer.description)
    }
}
