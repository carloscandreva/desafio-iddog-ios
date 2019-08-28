//
//  File.swift
//  desafiosIddogTests
//
//  Created by Carlos Alberto Mota Candreva on 28/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import XCTest
@testable import desafiosIddog

class DogViewModelTests: BaseTests {

    func testViewModelInit() {
        //Arrange
        let dog = DogViewModel(
                        imageURL: "image url")

        //Act
        let vm = DogViewModel(dog.imageURL)

        //Assert
        XCTAssertEqual(vm.imageURL, dog.imageURL)
    }
}
