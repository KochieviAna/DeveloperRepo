//
//  UIFont+Extension.swift
//  Assignment16
//
//  Created by MacBook on 18.10.24.
//

import UIKit

extension UIFont {
    static func oSSemiBold(size: CGFloat) -> UIFont {
        return UIFont(name: "OpenSans_Condensed-SemiBold", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func oSRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "OpenSans_Condensed-Regular", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func oSBold(size: CGFloat) -> UIFont {
        return UIFont(name: "OpenSans_SemiCondensed-ExtraBold", size: size) ?? .systemFont(ofSize: size)
    }
}
