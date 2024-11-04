//
//  QuestionPageVC.swift
//  Assignment21
//
//  Created by MacBook on 03.11.24.
//

import UIKit
import SnapKit

final class QuestionPageVC: UIViewController {
    
    private lazy var backArrowButton: UIButton = {
        let button = UIButton()
        let configuration = UIImage.SymbolConfiguration(weight: .bold)
        let boldImage = UIImage(systemName: "chevron.backward", withConfiguration: configuration)
        button.setImage(boldImage, for: .normal)
        button.tintColor = UIColor(hexString: "FFFFFF")
        button.addAction(UIAction(handler: { [ weak self ] action in
            self?.arrowBackButtonTapped()
        }), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var questionButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(hexString: "FFFFFF"), for: .normal)
        button.titleLabel?.font = .senMedium(size: 14)
        button.backgroundColor = UIColor(hexString: "8E84FF")
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(hexString: "B8B2FF").cgColor
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        addDiagonalGradientBackground(to: view)
        
        view.addSubview(backArrowButton)
        view.addSubview(questionButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        backArrowButton.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(71 * Constraint.yCoeff)
            make.leading.equalToSuperview().offset(22 * Constraint.xCoeff)
            make.height.equalTo(10.59 * Constraint.yCoeff)
            make.width.equalTo(6.09 * Constraint.xCoeff)
        }
        
        questionButton.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(65 * Constraint.yCoeff)
            make.leading.lessThanOrEqualTo(backArrowButton.snp.trailing).offset(203.91 * Constraint.xCoeff)
            make.trailing.equalToSuperview().offset(-24 * Constraint.xCoeff)
            make.height.equalTo(34 * Constraint.yCoeff)
            make.width.greaterThanOrEqualTo(81 * Constraint.xCoeff)
        }
    }
    
    private func arrowBackButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
