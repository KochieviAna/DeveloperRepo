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
        return button
    }()
    
    private lazy var planetStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ planetNameLabel, starButton ])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 4
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
        contentView.addSubview(planetStackView)
        contentView.addSubview(surfaceareaLabel)
    }
    
    private func setUpConstraints() {
        planetImage.translatesAutoresizingMaskIntoConstraints = false
        planetStackView.translatesAutoresizingMaskIntoConstraints = false
        surfaceareaLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            planetImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            planetImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            planetImage.heightAnchor.constraint(equalToConstant: 100),
            planetImage.widthAnchor.constraint(equalTo: planetImage.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            planetStackView.centerXAnchor.constraint(equalTo: planetImage.centerXAnchor),
            planetStackView.topAnchor.constraint(equalTo: planetImage.bottomAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            surfaceareaLabel.centerXAnchor.constraint(equalTo: planetStackView.centerXAnchor),
            surfaceareaLabel.topAnchor.constraint(equalTo: planetStackView.bottomAnchor, constant: 8)
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
    }
}
