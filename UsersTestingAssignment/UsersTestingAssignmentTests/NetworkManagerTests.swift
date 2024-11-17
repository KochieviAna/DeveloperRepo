//
//  NetworkManagerTests.swift
//  UsersTestingAssignmentTests
//
//  Created by MacBook on 18.11.24.
//

import XCTest
@testable import UsersTestingAssignment

class NetworkManagerTests: XCTestCase {
    var mockNetworkManager: MockNetworkManager!
    var networkManager: NetworkManager!
    
    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
        networkManager = NetworkManager.sharedInstance
    }
    
    override func tearDown() {
        mockNetworkManager = nil
        networkManager = nil
        super.tearDown()
    }
    
    func testMockNetworkManagerReturnsMockUsers() {
        let mockUsers = [
            User(gender: "female", name: Name(title: "Ms", first: "Jane", last: "Doe"), email: "jane.doe@example.com", picture: Picture(large: "", medium: "", thumbnail: ""), nat: "US", cell: "1234567890", phone: "9876543210")
        ]
        mockNetworkManager.mockUsers = mockUsers
        
        var fetchedUsers: [User] = []
        mockNetworkManager.fetchUsers(withLimit: 1) { users in
            fetchedUsers = users
        }
        
        XCTAssertEqual(fetchedUsers.count, 1)
        XCTAssertEqual(fetchedUsers.first?.name.first, "Jane")
        XCTAssertEqual(fetchedUsers.first?.email, "jane.doe@example.com")
    }
    
    func testNetworkManagerHandlesInvalidURL() {
        let invalidURLManager = NetworkManager.sharedInstance
        invalidURLManager.fetchUsers(withLimit: -1) { users in
            XCTAssertTrue(users.isEmpty, "Users list should be empty for invalid URL.")
        }
    }
}
