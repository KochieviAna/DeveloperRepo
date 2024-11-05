//
//  QuestionPageFooterView.swift
//  Assignment21
//
//  Created by MacBook on 04.11.24.
//

import UIKit

final class QuestionPageFooterView: UIView {
    
    lazy var quizlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hexString: "FFFFFF")
        label.font = .senRegular(size: 15)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = UIColor(hexString: "8E84FF")
        label.layer.cornerRadius = 12
        label.clipsToBounds = true
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(quizlabel)
        
        setupViewConstraints()
    }
    
    private func setupViewConstraints() {
        NSLayoutConstraint.activate([
            quizlabel.topAnchor.constraint(equalTo: topAnchor, constant: 41),
            quizlabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            quizlabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            quizlabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -49),
            quizlabel.heightAnchor.constraint(equalToConstant: 42)
        ])
    }
}
