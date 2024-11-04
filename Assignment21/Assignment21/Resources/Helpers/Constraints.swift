//
//  Constraints.swift
//  Assignment21
//
//  Created by MacBook on 03.11.24.
//

import UIKit

final class Constraint {
    static let deviceHeight = UIScreen.main.bounds.height
    static let deviceWidth = UIScreen.main.bounds.width
    
    static var xCoeff: CGFloat {
        return deviceWidth / 320.0
    }
    
    static var yCoeff: CGFloat {
        return deviceHeight / 606.0
    }
}
