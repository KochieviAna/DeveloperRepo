//
//  UIFont+Extension.swift
//  Assignment21
//
//  Created by MacBook on 03.11.24.
//

import UIKit

extension UIFont {
    static func senMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "Sen-Medium", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func senRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "Sen-Regular", size: size) ?? .systemFont(ofSize: size)
    }
}
