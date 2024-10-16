//
//  UIFont+Extension.swift
//  Assignment14
//
//  Created by MacBook on 13.10.24.
//

import UIKit

extension UIFont {
    static func arimoBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Arimo-Bold", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func arimoRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "Arimo-Regular", size: size) ?? .systemFont(ofSize: size)
    }
}
