//
//  MockNetworkManager.swift
//  UsersTestingAssignmentTests
//
//  Created by MacBook on 18.11.24.
//

import Foundation
@testable import UsersTestingAssignment

class MockNetworkManager: NetworkManagerProtocol {
    var mockUsers: [User] = []
    
    func fetchUsers(withLimit limit: Int, completionHandler: @escaping ([User]) -> Void) {
        completionHandler(mockUsers)
    }
}
