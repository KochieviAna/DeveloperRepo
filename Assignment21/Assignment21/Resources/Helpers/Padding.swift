//
//  Padding.swift
//  Assignment21
//
//  Created by MacBook on 06.11.24.
//

import UIKit

class PaddedLabel: UILabel {
    var leftInset: CGFloat = 0
    var rightInset: CGFloat = 0
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        var insets = bounds
        insets.origin.x += leftInset
        insets.size.width -= (leftInset + rightInset)
        return super.textRect(forBounds: insets, limitedToNumberOfLines: numberOfLines)
    }
    
    override func drawText(in rect: CGRect) {
        var insets = rect
        insets.origin.x += leftInset
        insets.size.width -= (leftInset + rightInset)
        super.drawText(in: insets)
    }
}
