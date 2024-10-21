//
//  PlanetListVC.swift
//  Assignment17
//
//  Created by MacBook on 21.10.24.
//

import UIKit

class PlanetListVC: UIViewController {
    
    private lazy var planetLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Planets"
        label.textColor = UIColor(hexString: "F2EDEB")
        label.font = .oSBold(size: 36)
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero)
        collectionView.backgroundColor = .clear
        collectionView.register(PlanetListCell.self, forCellWithReuseIdentifier: "PlanetListCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    let planetData: [PlanetData] = [
        PlanetData(
            image: UIImage(named: "Mercury")!,
            name: "Mercury",
            surfaceArea: "74 800 000 km²",
            temperature: "425°C",
            mass: "3,285E23 kg"),
        PlanetData(
            image: UIImage(named: "Venus")!,
            name: "Venus",
            surfaceArea: "460 200 000 km²",
            temperature: "465°C",
            mass: "4,867E24 kg"),
        PlanetData(
            image: UIImage(named: "Earth")!,
            name: "Earth",
            surfaceArea: "510 100 000 km²",
            temperature: "15°C",
            mass: "5,972E24 kg"),
        PlanetData(
            image: UIImage(named: "Mars")!,
            name: "Mars",
            surfaceArea: "144 400 000 km²",
            temperature: "-65°C",
            mass: "6,39E23 kg"),
        PlanetData(
            image: UIImage(named: "Jupiter")!,
            name: "Jupiter",
            surfaceArea: "6,142E10 km²",
            temperature: "-110°C",
            mass: "1,898E27 kg"),
        PlanetData(
            image: UIImage(named: "Saturn")!,
            name: "Saturn",
            surfaceArea: "4,27E10 km²",
            temperature: "-178°C",
            mass: "5,683E26 kg"),
        PlanetData(
            image: UIImage(named: "Uranus")!,
            name: "Uranus",
            surfaceArea: "8,083E9 km²",
            temperature: "-195°°C",
            mass: "8,681E25 kg"),
        PlanetData(
            image: UIImage(named: "Neptune")!,
            name: "Neptune",
            surfaceArea: "7,618E9 km²",
            temperature: "-214°C",
            mass: "1,024E26 kg")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "210D04")
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        setupUI()
        setupConstraints()
        collectionView.reloadData()
    }
    
    private func setupUI() {
        view.addSubview(planetLabel)
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        planetLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            planetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            planetLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: planetLabel.bottomAnchor, constant: 25),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

