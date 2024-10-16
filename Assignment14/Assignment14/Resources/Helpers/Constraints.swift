//
//  Constraints.swift
//  Assignment14
//
//  Created by MacBook on 13.10.24.
//

import UIKit

class Constraint {
  static let deviceHeight = UIScreen.main.bounds.height
  static let deviceWidth = UIScreen.main.bounds.width

  static var xCoeff: CGFloat {
    return deviceWidth / 390.0
  }

  static var yCoeff: CGFloat {
    return deviceHeight / 800.0
  }
}
