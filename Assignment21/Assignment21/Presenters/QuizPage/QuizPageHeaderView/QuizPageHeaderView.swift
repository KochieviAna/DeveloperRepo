//
//  QuizPageHeaderView.swift
//  Assignment21
//
//  Created by MacBook on 04.11.24.
//

import UIKit
import SnapKit

final class QuizPageHeaderView: UIView {
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Quiz"
        label.font = .senRegular(size: 24)
        label.textColor = UIColor(hexString: "FFFFFF")
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(UIColor(hexString: "FFFFFF"), for: .normal)
        button.titleLabel?.font = .senMedium(size: 14)
        button.backgroundColor = UIColor(hexString: "8E84FF")
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(hexString: "B8B2FF").cgColor
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        resetButton.layer.cornerRadius = resetButton.frame.height / 2
    }
    
    private func setupView() {
        backgroundColor = .clear
        
        addSubview(headerLabel)
        addSubview(resetButton)
        
        setupViewConstraints()
    }
    
    private func setupViewConstraints() {
        headerLabel.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(13 * Constraint.yCoeff)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview().offset(-14 * Constraint.yCoeff)
        }
        
        resetButton.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(11 * Constraint.yCoeff)
            make.leading.equalTo(headerLabel.snp.trailing).offset(156 * Constraint.xCoeff)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-11 * Constraint.yCoeff)
            make.height.equalTo(34 * Constraint.yCoeff)
            make.width.equalTo(66 * Constraint.xCoeff)
        }
    }
}
