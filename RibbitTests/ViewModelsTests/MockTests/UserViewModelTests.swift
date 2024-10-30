//
//  UserViewModelTests.swift
//  Ribbit
//
//  Created by Jorge Urias on 10/30/24.
//

import XCTest
@testable import Ribbit

class UserViewModelTests: XCTestCase {
    var viewModel: UserViewModel!
    var mockUserService: MockUserService!

    override func setUp() {
        super.setUp()
        mockUserService = MockUserService()
        viewModel = UserViewModel(userService: mockUserService)
    }

    func testFetchUserSuccess() {
        let expectation = XCTestExpectation(description: "Fetch user successfully")

        mockUserService.shouldReturnError = false
        viewModel.fetchUser(id: "test-id")

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertEqual(self.viewModel.user?.name, "Test User")
            XCTAssertFalse(self.viewModel.isLoading)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func testFetchUserFailure() {
        let expectation = XCTestExpectation(description: "Fail to fetch user")

        mockUserService.shouldReturnError = true
        viewModel.fetchUser(id: "test-id")

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertNil(self.viewModel.user)
            XCTAssertFalse(self.viewModel.isLoading)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
}
