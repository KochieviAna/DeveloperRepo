//
//  QuizPageHeaderView.swift
//  Assignment21
//
//  Created by MacBook on 04.11.24.
//

import UIKit

final class QuizPageHeaderView: UIView {
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Quiz"
        label.font = .senRegular(size: 24)
        label.textColor = UIColor(hexString: "FFFFFF")
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
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
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 13),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14)
        ])
        
        NSLayoutConstraint.activate([
            resetButton.topAnchor.constraint(equalTo: topAnchor, constant: 11),
            resetButton.leadingAnchor.constraint(greaterThanOrEqualTo: headerLabel.trailingAnchor, constant: 156),
            resetButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            resetButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -11),
            resetButton.heightAnchor.constraint(equalToConstant: 34),
            resetButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 66)
        ])
    }
}
