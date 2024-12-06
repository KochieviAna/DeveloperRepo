//
//  Font+Extension.swift
//  Assignment28
//
//  Created by MacBook on 06.12.24.
//

import SwiftUI

extension Font {
    static func robotoBold(size: CGFloat) -> Font {
        return Font.custom("Roboto-Bold", size: size)
    }
    
    static func robotoRegular(size: CGFloat) -> Font {
        return Font.custom("Roboto-Regular", size: size)
    }
}
