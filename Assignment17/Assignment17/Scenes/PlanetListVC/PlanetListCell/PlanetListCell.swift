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
        button.setImage(UIImage(named: "star"), for: .normal)
        button.setImage(UIImage(named: "star_filled"), for: .selected)
        button.addAction(UIAction(handler: { [ weak self ] action in
            self?.starButtonTapped()
        }), for: .touchUpInside)
        button.backgroundColor = .clear
        button.tintColor = .white
        return button
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
        contentView.addSubview(planetNameLabel)
        contentView.addSubview(starButton)
        contentView.addSubview(surfaceareaLabel)
    }
    
    private func setUpConstraints() {
        planetImage.translatesAutoresizingMaskIntoConstraints = false
        planetNameLabel.translatesAutoresizingMaskIntoConstraints = false
        starButton.translatesAutoresizingMaskIntoConstraints = false
        surfaceareaLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            planetImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            planetImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            planetImage.heightAnchor.constraint(equalToConstant: 100),
            planetImage.widthAnchor.constraint(equalTo: planetImage.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            planetNameLabel.centerXAnchor.constraint(equalTo: planetImage.centerXAnchor),
            planetNameLabel.topAnchor.constraint(equalTo: planetImage.bottomAnchor, constant: 5),
            planetNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            planetNameLabel.heightAnchor.constraint(equalToConstant: 50),
            planetNameLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            starButton.topAnchor.constraint(equalTo: planetNameLabel.topAnchor),
            starButton.leadingAnchor.constraint(greaterThanOrEqualTo: planetNameLabel.trailingAnchor, constant: 3),
            starButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            starButton.heightAnchor.constraint(equalToConstant: 15),
            starButton.widthAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
            surfaceareaLabel.centerXAnchor.constraint(equalTo: planetNameLabel.centerXAnchor),
            surfaceareaLabel.topAnchor.constraint(equalTo: planetNameLabel.bottomAnchor, constant: 2),
            surfaceareaLabel.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func starButtonTapped() {
        starButton.isSelected.toggle()
        if starButton.isSelected {
            starButton.setImage(UIImage(named: "star_filled"), for: .normal)
        } else {
            starButton.setImage(UIImage(named: "star"), for: .normal)
        }
    }
    
    public func configureCell(with data: PlanetData) {
        planetImage.image = data.image
        planetNameLabel.text = data.name
        surfaceareaLabel.text = data.surfaceArea
        starButton.isSelected = false
    }
}
