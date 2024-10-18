//
//  PlanetListVC.swift
//  Assignment16
//
//  Created by MacBook on 18.10.24.
//

import UIKit

final class PlanetListVC: UIViewController {
    
    private lazy var planetLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Planets"
        label.textColor = UIColor(hexString: "B34416")
        label.font = .systemFont(ofSize: 36, weight: .bold)
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
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
        tableView.register(PlanetCell.self, forCellReuseIdentifier: "PlanetCell")
        setupUI()
        setupConstraints()
        tableView.reloadData()
    }
    
    private func setupUI() {
        view.addSubview(planetLabel)
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        planetLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            planetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            planetLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: planetLabel.bottomAnchor, constant: 25),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
