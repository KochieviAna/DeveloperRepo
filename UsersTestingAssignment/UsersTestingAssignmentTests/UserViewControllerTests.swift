//
//  UserViewControllerTests.swift
//  UsersTestingAssignmentTests
//
//  Created by MacBook on 18.11.24.
//

import XCTest
@testable import UsersTestingAssignment

final class UserViewControllerTests: XCTestCase {
    var viewController: UserViewController!
    var mockNetworkManager: MockNetworkManager!
    
    
    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
        viewController = UserViewController(networkManager: mockNetworkManager)
    }
    
    override func tearDown() {
        viewController = nil
        mockNetworkManager = nil
        super.tearDown()
    }
    
    func testFetchUsersEmpty() {
        mockNetworkManager.mockUsers = []
        viewController.fetchUsersAPICall()
        
        XCTAssertEqual(viewController.usersVM.count, 0)
    }
}
