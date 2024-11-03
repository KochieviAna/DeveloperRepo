//
//  QuizPageCell.swift
//  Assignment21
//
//  Created by MacBook on 03.11.24.
//

import UIKit
import SnapKit

class QuizPageCell: UITableViewCell {
    
    static let identifier = "QuizPageCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        setupCellConstraints()
    }
    
    private func setupCellConstraints() {
        
    }
}
