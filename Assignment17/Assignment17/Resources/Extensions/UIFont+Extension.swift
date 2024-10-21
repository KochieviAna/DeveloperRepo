//
//  UIFont+Extension.swift
//  Assignment17
//
//  Created by MacBook on 21.10.24.
//

import UIKit

extension UIFont {
    static func oSBold(size: CGFloat) -> UIFont {
        return UIFont(name: "OpenSans_Condensed-Bold", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func oSSemiBold(size: CGFloat) -> UIFont {
        return UIFont(name: "OpenSans_Condensed-SemiBold", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func oSRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "OpenSans_SemiCondensed-Regular", size: size) ?? .systemFont(ofSize: size)
    }
}
