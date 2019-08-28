//
//  DogsServiceTest.swift
//  desafiosIddogTests
//
//  Created by Carlos Alberto Mota Candreva on 28/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import XCTest
@testable import desafiosIddog


class DogServiceTests: BaseTests {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testNotReachable() {
        //Arrange
        let expectation = self.expectation(description: "Expect generic error")

        let service = DogsService(reachability: ReachabilityMock(reachable: false))

        //Act
        service.getDogsList(token: "", category: "") { callback in
            do {
                _ = try callback()
            } catch Errors.offlineMode {
                expectation.fulfill()
            } catch { }
        }

        //Assert
        waitForExpectations(timeout: 1)
    }



    func testApiError() {
        //Arrange
        let expectation = self.expectation(description: "Expect generic error")

        let service = DogsService(reachability: ReachabilityMock())

        //Act
        service.getDogsList(token: "", category: "") { callback in
            do {
                _ = try callback()
            } catch Errors.offlineMode {
                expectation.fulfill()
            } catch { }
        }

        //Assert
        waitForExpectations(timeout: 1)
    }

    func testParseError() {
        //Arrange
        let expectation = self.expectation(description: "Expect parse error")

        let service = DogsService(reachability: ReachabilityMock())

        //Act
        service.getDogsList(token: "", category: "") { callback in
            do {
                _ = try callback()
            } catch Errors.parse {
                expectation.fulfill()
            } catch { }
        }

        //Assert
        waitForExpectations(timeout: 1)
    }

    func testSuccess() {
        //Arrange
        let expectation = self.expectation(description: "Expect success")

        let service = DogsService(reachability: ReachabilityMock())
        var dogList: [DogViewModel] = []
        //Act
        service.getDogsList(token: "", category: "") { callback in
            do {
                dogList = try callback()
                expectation.fulfill()
            } catch { }
        }

        //Assert
        waitForExpectations(timeout: 1)
        XCTAssertEqual(dogList.count, 1)
        XCTAssertEqual(dogList[0].imageURL, "https://images.dog.ceo/breeds/husky/n02110185_10047.jpg")
    }
}
