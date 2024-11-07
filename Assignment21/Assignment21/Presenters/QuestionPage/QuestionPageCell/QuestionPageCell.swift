//
//  QuestionPageCell.swift
//  Assignment21
//
//  Created by MacBook on 03.11.24.
//

import UIKit

final class QuestionPageCell: UITableViewCell {
    
    private lazy var answerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hexString: "2B0063")
        label.font = .senRegular(size: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var checkmarkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "circle")
        imageView.tintColor = UIColor(hexString: "2B0063")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var labelAndImageWrapperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hexString: "FFFFFF")
        view.layer.cornerRadius = 12
        return view
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
        contentView.addSubview(labelAndImageWrapperView)
        labelAndImageWrapperView.addSubview(checkmarkImageView)
        labelAndImageWrapperView.addSubview(answerLabel)
        
        setupCellConstraints()
    }
    
    private func setupCellConstraints() {
        NSLayoutConstraint.activate([
            labelAndImageWrapperView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 4),
            labelAndImageWrapperView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            labelAndImageWrapperView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            labelAndImageWrapperView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -4)
        ])
        
        NSLayoutConstraint.activate([
            checkmarkImageView.topAnchor.constraint(equalTo: labelAndImageWrapperView.topAnchor, constant: 15),
            checkmarkImageView.leadingAnchor.constraint(equalTo: labelAndImageWrapperView.leadingAnchor, constant: 15),
            checkmarkImageView.bottomAnchor.constraint(equalTo: labelAndImageWrapperView.bottomAnchor, constant: -15),
            checkmarkImageView.heightAnchor.constraint(equalToConstant: 19),
            checkmarkImageView.widthAnchor.constraint(equalTo: checkmarkImageView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            answerLabel.centerYAnchor.constraint(equalTo: labelAndImageWrapperView.centerYAnchor),
            answerLabel.leadingAnchor.constraint(equalTo: checkmarkImageView.trailingAnchor, constant: 16),
            answerLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -15),
        ])
    }
    
    func configureCell(with answerText: String) {
        answerLabel.text = answerText
    }
    
    func updateSelectionAppearance(isSelected: Bool) {
        if isSelected {
            applySelectedAppearance()
        } else {
            applyDeselectedAppearance()
        }
    }
    
    func updateAnswerCorrectnessAppearance(isCorrect: Bool) {
        if isCorrect {
            checkmarkImageView.image = UIImage(systemName: "checkmark.circle.fill")
        } else {
            checkmarkImageView.image = UIImage(systemName: "checkmark.circle")
        }
    }
    
    private func applySelectedAppearance() {
        labelAndImageWrapperView.backgroundColor = UIColor(hexString: "8E84FF")
        answerLabel.textColor = UIColor(hexString: "FFFFFF")
        checkmarkImageView.image = UIImage(systemName: "checkmark.circle.fill")
        checkmarkImageView.tintColor = UIColor(hexString: "2B0063")
    }
    
    private func applyDeselectedAppearance() {
        labelAndImageWrapperView.backgroundColor = UIColor(hexString: "FFFFFF")
        answerLabel.textColor = UIColor(hexString: "2B0063")
        checkmarkImageView.image = UIImage(systemName: "circle")
        checkmarkImageView.tintColor = UIColor(hexString: "2B0063")
    }
}
