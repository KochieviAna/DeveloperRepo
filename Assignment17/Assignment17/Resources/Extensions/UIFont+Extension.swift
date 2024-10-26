//
//  UIFont+Extension.swift
//  Assignment17
//
//  Created by MacBook on 21.10.24.
//

import UIKit

extension UIFont {
    static func oSBold(size: CGFloat) -> UIFont {
        return UIFont(name: "OpenSans-Bold.ttf", size: size) ?? .systemFont(ofSize: size, weight: .bold)
    }
    
    static func oSRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "OpenSans-Regular.ttf", size: size) ?? .systemFont(ofSize: size, weight: .medium)
    }
}
