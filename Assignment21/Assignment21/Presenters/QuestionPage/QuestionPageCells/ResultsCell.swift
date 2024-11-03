//
//  ResultsCell.swift
//  Assignment21
//
//  Created by MacBook on 03.11.24.
//

import UIKit

class ResultsCell: UITableViewCell {
    
    static let identifier = "ResultsCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
