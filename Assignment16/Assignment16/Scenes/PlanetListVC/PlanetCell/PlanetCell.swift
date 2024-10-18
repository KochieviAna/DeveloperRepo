//
//  PlanetCell.swift
//  Assignment16
//
//  Created by MacBook on 18.10.24.
//

import UIKit

final class PlanetCell: UITableViewCell {
    
    private lazy var planetImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        return imageView
    }()
    
    private lazy var planetNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.numberOfLines = 0
        label.textColor = UIColor(hexString: "F2EDEB")
        return label
    }()
    
    private lazy var surfaceareaLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = UIColor(hexString: "F2EDEB")
        return label
    }()
 
    private lazy var arrowImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "navigate_next")
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupUI() {
        contentView.addSubview(planetImage)
        contentView.addSubview(planetNameLabel)
        contentView.addSubview(surfaceareaLabel)
        contentView.addSubview(arrowImage)
    }
    
    private func setupConstraints() {
        planetImage.translatesAutoresizingMaskIntoConstraints = false
        planetNameLabel.translatesAutoresizingMaskIntoConstraints = false
        surfaceareaLabel.translatesAutoresizingMaskIntoConstraints = false
        arrowImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            planetImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            planetImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            planetImage.heightAnchor.constraint(equalToConstant: 100),
            planetImage.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            planetNameLabel.topAnchor.constraint(equalTo: planetImage.topAnchor),
            planetNameLabel.leadingAnchor.constraint(equalTo: planetImage.trailingAnchor, constant: 36),
            planetNameLabel.widthAnchor.constraint(equalToConstant: 150),
            planetNameLabel.heightAnchor.constraint(equalToConstant: 49)
        ])
        
        NSLayoutConstraint.activate([
            surfaceareaLabel.topAnchor.constraint(equalTo: planetNameLabel.bottomAnchor, constant: 2),
            surfaceareaLabel.leadingAnchor.constraint(equalTo: planetNameLabel.leadingAnchor),
            surfaceareaLabel.heightAnchor.constraint(equalToConstant: 25),
            surfaceareaLabel.widthAnchor.constraint(equalToConstant: 128)
        ])
        
        NSLayoutConstraint.activate([
            arrowImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            arrowImage.leadingAnchor.constraint(equalTo: surfaceareaLabel.trailingAnchor, constant: 25),
            arrowImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    public func configureCell(with data: PlanetData) {
        planetImage.image = data.image
        planetNameLabel.text = data.name
        surfaceareaLabel.text = String(data.surfaceArea)
    }
}
