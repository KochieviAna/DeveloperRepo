//
//  UserViewModelTests.swift
//  UsersTestingAssignmentTests
//
//  Created by MacBook on 18.11.24.
//

import XCTest
@testable import UsersTestingAssignment

final class UserViewModelTests: XCTestCase {
    var user: User!
    var userViewModel: UserViewModel!
    
    override func setUp() {
        super.setUp()
        let jsonData = User.jsonMock.data(using: .utf8)!
        let userList = try! JSONDecoder().decode(UserList.self, from: jsonData)
        user = userList.results.first
        userViewModel = UserViewModel(user: user)
    }
    
    override func tearDown() {
        user = nil
        userViewModel = nil
        super.tearDown()
    }
    
    func testFullName() {
        let expectedFullName = "Mr Christian Nielsen"
        let actualFullName = userViewModel.fullName
        
        XCTAssertEqual(actualFullName, expectedFullName)
    }
    
    func testContactNumber() {
        let expectedContactNumber = "85537737 / 57231440"
        let actualContactNumber = userViewModel.contactNumber
        
        XCTAssertEqual(actualContactNumber, expectedContactNumber)
    }
    
    func testThumbnailImageUrl() {
        let expectedUrl = URL(string: "https://randomuser.me/api/portraits/thumb/men/25.jpg")
        let actualUrl = userViewModel.thumbnailImageUrl
        
        XCTAssertEqual(actualUrl, expectedUrl)
    }
    
    func testEmail() {
        let expectedEmail = "christian.nielsen@example.com"
        let actualEmail = userViewModel.email
        
        XCTAssertEqual(actualEmail, expectedEmail)
    }
}
