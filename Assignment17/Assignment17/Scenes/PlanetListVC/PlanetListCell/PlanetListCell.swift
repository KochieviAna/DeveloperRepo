//
//  PlanetListCell.swift
//  Assignment17
//
//  Created by MacBook on 21.10.24.
//

import UIKit

class PlanetListCell: UICollectionViewCell {
    
    private lazy var planetImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var planetNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .oSBold(size: 36)
        label.numberOfLines = 0
        label.textColor = UIColor(hexString: "F2EDEB")
        return label
    }()
    
    private lazy var surfaceareaLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .oSRegular(size: 18)
        label.textColor = UIColor(hexString: "F2EDEB")
        return label
    }()
    
    private lazy var starButton: UIButton = {
        let button = UIButton(frame: .zero)
        let starImage = UIImage(systemName: "star.fill")
        button.setImage(starImage, for: .normal)
        button.setImage(starImage, for: .selected)
        button.tintColor = UIColor(hexString: "F2F2F2")
        button.addAction(UIAction(handler: { [ weak self ] action in
            self?.starButtonTapped()
        }), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonAndLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [planetNameLabel, starButton])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        contentView.addSubview(planetImage)
        contentView.addSubview(buttonAndLabelStackView)
        contentView.addSubview(surfaceareaLabel)
    }
    
    private func setUpConstraints() {
        planetImage.translatesAutoresizingMaskIntoConstraints = false
        buttonAndLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        surfaceareaLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            planetImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            planetImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            planetImage.heightAnchor.constraint(equalToConstant: 100),
            planetImage.widthAnchor.constraint(equalTo: planetImage.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            buttonAndLabelStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            buttonAndLabelStackView.topAnchor.constraint(equalTo: planetImage.bottomAnchor, constant: 5),
            buttonAndLabelStackView.widthAnchor.constraint(lessThanOrEqualToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            surfaceareaLabel.centerXAnchor.constraint(equalTo: planetImage.centerXAnchor),
            surfaceareaLabel.topAnchor.constraint(equalTo: planetNameLabel.bottomAnchor, constant: 2),
            surfaceareaLabel.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func starButtonTapped() {
        starButton.isSelected.toggle()
        if starButton.isSelected {
            starButton.tintColor = UIColor(hexString: "DFB300")
        } else {
            starButton.tintColor = UIColor(hexString: "F2F2F2")
        }
    }
    
    public func configureCell(with data: PlanetData) {
        planetImage.image = data.image
        planetNameLabel.text = data.name
        surfaceareaLabel.text = data.surfaceArea
        starButton.isSelected = data.isFavorite
    }
}
