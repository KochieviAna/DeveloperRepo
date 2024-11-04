//
//  QuizPageCell.swift
//  Assignment21
//
//  Created by MacBook on 03.11.24.
//

import UIKit
import SnapKit

final class QuizPageCell: UITableViewCell {
    
    private lazy var quizlabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "2B0063")
        label.font = .senRegular(size: 15)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = UIColor(hexString: "FFFFFF")
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        
        return label
    }()
    
    static let identifier = "QuizPageCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        addSubview(quizlabel)
        
        setupCellConstraints()
    }
    
    private func setupCellConstraints() {
        quizlabel.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(10 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10 * Constraint.yCoeff)
        }
    }
    
    public func configure(with model: QuizPageViewModel) {
    }
}
