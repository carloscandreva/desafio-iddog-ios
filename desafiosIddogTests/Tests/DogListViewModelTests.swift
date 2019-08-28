//
//  DogListViewModelTests.swift
//  desafiosIddogTests
//
//  Created by Carlos Alberto Mota Candreva on 28/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import XCTest
@testable import desafiosIddog

class DogServiceMock: DogServiceProtocol {

    var dogList: [DogViewModel]?
    private var error: Error?

    init(dogList: [DogViewModel]? = [], error: Error? = nil) {
        self.dogList = dogList
        self.error = error
    }

    func getDogsList(token: String, category: String, completion: @escaping ((() throws -> ([DogViewModel])) -> Void)) {
        if let error = error {
            completion { throw error }
        } else if let dogList = dogList {
            completion { dogList }
        }
    }
}

class DogListViewModelDelegateMock: DogListViewModelDelegate {
    typealias ModelWasFetchAssertionType = (DogListViewModel) -> Void
    typealias ModelThrewErrorAssertionType = (DogListViewModel, Error) -> Void
    private var modelWasFetchAssertion: ModelWasFetchAssertionType?
    private var modelThrewErrorAssertion: ModelThrewErrorAssertionType?

    init(modelWasFetchAssertion: ModelWasFetchAssertionType? = nil,
         modelThrewErrorAssertion: ModelThrewErrorAssertionType? = nil) {
        self.modelWasFetchAssertion = modelWasFetchAssertion
        self.modelThrewErrorAssertion = modelThrewErrorAssertion
    }

    func dogListViewModelWasFetch(_ viewModel: DogListViewModel) {
        modelWasFetchAssertion?(viewModel)
    }

    func dogListViewModel(_ viewModel: DogListViewModel, threw error: Error) {
        modelThrewErrorAssertion?(viewModel, error)
    }
}

class DogListViewModelTests: BaseTests {
    func testSuccessfullFetch() {
        //Arrange
        let expectation = self.expectation(description: "Delegate was called")
        let dog = DogViewModel(
                        imageURL: "image url")
        var dogList: [DogViewModel] = []
        dogList.append(dog)
        let dogListServiceMock = DogServiceMock(dogList: dogList)
        let vm = DogListViewModel(dogsService: dogListServiceMock)
        let vmDelegate = DogListViewModelDelegateMock(modelWasFetchAssertion: { viewModel in
            expectation.fulfill()
            XCTAssertTrue(viewModel === vm)
        })
        vm.delegate = vmDelegate

        //Act
        vm.fetch()

        //Assert
        waitForExpectations(timeout: 1)
        XCTAssertEqual(vm.dogs.first?.imageURL, dog.imageURL)
    }

    func testErrorFetch() {
        //Arrange
        let expectation = self.expectation(description: "Delegate was called")
        let dogListServiceMock = DogServiceMock(error: Errors.generic)
        let vm = DogListViewModel(dogsService: dogListServiceMock)
        let vmDelegate = DogListViewModelDelegateMock(modelThrewErrorAssertion: { viewModel, error in
            expectation.fulfill()
            XCTAssertTrue(viewModel === vm)
            guard case Errors.generic = error else {
                XCTFail("Wrong error type")
                return
            }
        })
        vm.delegate = vmDelegate

        //Act
        vm.fetch()

        //Assert
        waitForExpectations(timeout: 1)

    }

}
