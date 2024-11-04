//
//  QuestionPageHeaderView.swift
//  Assignment21
//
//  Created by MacBook on 04.11.24.
//

import UIKit
import SnapKit

final class QuestionPageHeaderView: UIView {
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.font = .senRegular(size: 20)
        label.textColor = UIColor(hexString: "FFFFFF")
        label.textAlignment = .left
        label.numberOfLines = 0
        
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
        addSubview(headerLabel)
        
        setupViewConstraints()
    }
    
    private func setupViewConstraints() {
        headerLabel.snp.remakeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-26 * Constraint.yCoeff)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let size = headerLabel.sizeThatFits(CGSize(width: UIScreen.main.bounds.width - 20, height: CGFloat.greatestFiniteMagnitude))
        return CGSize(width: size.width, height: size.height + 50)
    }
}
