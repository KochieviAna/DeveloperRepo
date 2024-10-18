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
        label.textColor = UIColor(hexString: "F2EDEB")
        return label
    }()
    
    private lazy var surfaceareaLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.textColor = UIColor(hexString: "F2EDEB")
        return label
    }()
    
    private lazy var arrowImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "greaterthan")
        imageView.tintColor = UIColor(hexString: "B34416")
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
            planetImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            planetImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            planetImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            planetImage.heightAnchor.constraint(equalToConstant: 100),
            planetImage.widthAnchor.constraint(equalTo: planetImage.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            planetNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            planetNameLabel.leadingAnchor.constraint(equalTo: planetImage.trailingAnchor, constant: 36)
        ])
        
        NSLayoutConstraint.activate([
            surfaceareaLabel.topAnchor.constraint(equalTo: planetNameLabel.bottomAnchor, constant: 22),
            surfaceareaLabel.leadingAnchor.constraint(equalTo: planetNameLabel.leadingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            arrowImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            arrowImage.leadingAnchor.constraint(equalTo: planetNameLabel.trailingAnchor, constant: 47),
            arrowImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    public func configureCell(with data: PlanetData) {
        planetImage.image = data.image
        planetNameLabel.text = data.name
        surfaceareaLabel.text = String(data.surfaceArea)
    }
}
