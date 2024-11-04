//
//  QuestionPageFooterView.swift
//  Assignment21
//
//  Created by MacBook on 04.11.24.
//

import UIKit
import SnapKit

final class QuestionPageFooterView: UIView {
    
    lazy var quizlabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "FFFFFF")
        label.font = .senRegular(size: 15)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = UIColor(hexString: "8E84FF")
        label.layer.cornerRadius = 10
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
        quizlabel.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(41 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-49 * Constraint.yCoeff)
            make.height.equalTo(42 * Constraint.yCoeff)
        }
    }
}
