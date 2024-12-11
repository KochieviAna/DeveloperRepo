//
//  Font+Extensiojn.swift
//  Assignment29
//
//  Created by MacBook on 08.12.24.
//

import SwiftUI

extension Font {
    static func interLight(size: CGFloat) -> Font {
        return Font.custom("Inter-Light", size: size)
    }
    
    static func interRegular(size: CGFloat) -> Font {
        return Font.custom("Inter-Regular", size: size)
    }
    
    static func interSemiBold(size: CGFloat) -> Font {
        return Font.custom("Inter-SemiBold", size: size)
    }

    static func robotoRegular(size: CGFloat) -> Font {
        return Font.custom("Roboto-Regular", size: size)
    }
}
