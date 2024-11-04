//
//  QuestionPageCell.swift
//  Assignment21
//
//  Created by MacBook on 03.11.24.
//

import UIKit
import SnapKit

final class QuestionPageCell: UITableViewCell {
    
    private lazy var answerButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(hexString: "2B0063"), for: .normal)
        button.setTitleColor(UIColor(hexString: "FFFFFF"), for: .selected)
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.setImage(UIImage(systemName: "checkmark.circle"), for: .selected)
        button.tintColor = UIColor(hexString: "2B0063")
        button.titleLabel?.font = .senRegular(size: 16)
        button.backgroundColor = UIColor(hexString: "FFFFFF")
        button.layer.cornerRadius = 10
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        button.addAction(UIAction(handler: { [ weak self ] action in
            self?.answerButtonTapped()
        }), for: .touchUpInside)
        
        return button
    }()
    
    static let identifier = "QuestionPageCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        addSubview(answerButton)
        
        setupCellConstraints()
    }
    
    private func setupCellConstraints() {
        answerButton.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(4 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-4 * Constraint.yCoeff)
        }
    }
    
    private func answerButtonTapped() {
        answerButton.isSelected.toggle()
        answerButton.backgroundColor = answerButton.isSelected ? UIColor(hexString: "8E84FF") : UIColor(hexString: "FFFFFF")
    }
}
