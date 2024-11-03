//
//  AnswersCell.swift
//  Assignment21
//
//  Created by MacBook on 03.11.24.
//

import UIKit

class AnswersCell: UITableViewCell {
    
    static let identifier = "AnswersCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
