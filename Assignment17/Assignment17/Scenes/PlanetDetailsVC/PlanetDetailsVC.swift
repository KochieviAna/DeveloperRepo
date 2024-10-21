//
//  PlanetDetailsVC.swift
//  Assignment17
//
//  Created by MacBook on 21.10.24.
//

import UIKit

class PlanetDetailsVC: UIViewController {
    
    private lazy var arrowBackButton: UIButton = {
        let imageButton = UIButton(frame: .zero)
        imageButton.setImage(UIImage(named: "navigate_before"), for: .normal)
        imageButton.addAction(UIAction(handler: { [ weak self ] action in
            self?.arrowBackButtonTapped()
        }), for: .touchUpInside)
        return imageButton
    }()
    
    private lazy var planetNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hexString: "F2EDEB")
        label.font = .oSBold(size: 36)
        return label
    }()
    
    private lazy var starButton: UIButton = {
        let button = UIButton(frame: .zero)
        let starImage = UIImage(systemName: "star.fill")
        button.setImage(starImage, for: .normal)
        button.setImage(starImage, for: .selected)
        return button
    }()
    
    private lazy var planetDisplayImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        return imageView
    }()
    
    private lazy var areaLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Area"
        label.textColor = UIColor(hexString: "FFFFFF")
        label.textAlignment = .left
        label.font = .oSRegular(size: 18)
        return label
    }()
    
    private lazy var areaValueLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hexString: "FFFFFF")
        label.textAlignment = .right
        label.font = .oSRegular(size: 18)
        return label
    }()
    
    private lazy var areaStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [areaLabel, areaValueLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.layer.borderColor = UIColor.white.cgColor
        stackView.layer.borderWidth = 1
        stackView.layer.cornerRadius = 15
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return stackView
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Temperature"
        label.textColor = UIColor(hexString: "FFFFFF")
        label.textAlignment = .left
        label.font = .oSRegular(size: 18)
        return label
    }()
    
    private lazy var temperatureValueLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hexString: "FFFFFF")
        label.textAlignment = .right
        label.font = .oSRegular(size: 18)
        return label
    }()
    
    private lazy var temperatureStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [temperatureLabel, temperatureValueLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.layer.borderColor = UIColor.white.cgColor
        stackView.layer.borderWidth = 1
        stackView.layer.cornerRadius = 15
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return stackView
    }()
    
    private lazy var massLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Mass"
        label.textColor = UIColor(hexString: "FFFFFF")
        label.textAlignment = .left
        label.font = .oSRegular(size: 18)
        return label
    }()
    
    private lazy var massValueLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hexString: "FFFFFF")
        label.textAlignment = .right
        label.font = .oSRegular(size: 18)
        return label
    }()
    
    private lazy var massStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [massLabel, massValueLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.layer.borderColor = UIColor.white.cgColor
        stackView.layer.borderWidth = 1
        stackView.layer.cornerRadius = 15
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return stackView
    }()
    
    var planetName: String?
    var planetImage: UIImage?
    var area: String?
    var temperature: String?
    var mass: String?
    var favorite: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "210D04")
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        setupUI()
        setupConstraints()
        setUpDetails()
    }
    
    private func setupUI() {
        view.addSubview(arrowBackButton)
        view.addSubview(planetNameLabel)
        view.addSubview(starButton)
        view.addSubview(planetDisplayImage)
        view.addSubview(areaStackView)
        view.addSubview(temperatureStackView)
        view.addSubview(massStackView)
    }
    
    private func setupConstraints() {
        arrowBackButton.translatesAutoresizingMaskIntoConstraints = false
        planetNameLabel.translatesAutoresizingMaskIntoConstraints = false
        starButton.translatesAutoresizingMaskIntoConstraints = false
        planetDisplayImage.translatesAutoresizingMaskIntoConstraints = false
        areaStackView.translatesAutoresizingMaskIntoConstraints = false
        temperatureStackView.translatesAutoresizingMaskIntoConstraints = false
        massStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            arrowBackButton.centerYAnchor.constraint(equalTo: planetNameLabel.centerYAnchor),
            arrowBackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            planetNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            planetNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25)
        ])
        
        NSLayoutConstraint.activate([
            starButton.centerYAnchor.constraint(equalTo: planetNameLabel.centerYAnchor),
            starButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            starButton.heightAnchor.constraint(equalToConstant: 25),
            starButton.widthAnchor.constraint(equalTo: starButton.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            planetDisplayImage.topAnchor.constraint(equalTo: planetNameLabel.topAnchor, constant: 86),
            planetDisplayImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            planetDisplayImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            planetDisplayImage.heightAnchor.constraint(equalToConstant: 280),
            planetDisplayImage.widthAnchor.constraint(equalTo: planetDisplayImage.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            areaStackView.topAnchor.constraint(lessThanOrEqualTo: planetDisplayImage.bottomAnchor, constant: 112),
            areaStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            areaStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            areaStackView.heightAnchor.constraint(equalToConstant: 52)
        ])
        
        NSLayoutConstraint.activate([
            temperatureStackView.topAnchor.constraint(equalTo: areaStackView.bottomAnchor, constant: 15),
            temperatureStackView.leadingAnchor.constraint(equalTo: areaStackView.leadingAnchor),
            temperatureStackView.trailingAnchor.constraint(equalTo: areaStackView.trailingAnchor),
            temperatureStackView.heightAnchor.constraint(equalTo: areaStackView.heightAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            massStackView.topAnchor.constraint(equalTo: temperatureStackView.bottomAnchor, constant: 15),
            massStackView.leadingAnchor.constraint(equalTo: temperatureStackView.leadingAnchor),
            massStackView.trailingAnchor.constraint(equalTo: temperatureStackView.trailingAnchor),
            massStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            massStackView.heightAnchor.constraint(equalTo: temperatureStackView.heightAnchor)
            
        ])
    }
    
    private func setUpDetails() {
        planetNameLabel.text = planetName
        planetDisplayImage.image = planetImage
        areaValueLabel.text = area
        temperatureValueLabel.text = temperature
        massValueLabel.text = mass
    }
    
    private func arrowBackButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
