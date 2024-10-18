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
            surfaceArea: "74 800 000 km²"),
        PlanetData(
            image: UIImage(named: "Venus")!,
            name: "Venus",
            surfaceArea: "460 200 000 km²"),
        PlanetData(
            image: UIImage(named: "Earth")!,
            name: "Earth",
            surfaceArea: "510 100 000 km²"),
        PlanetData(
            image: UIImage(named: "Mars")!,
            name: "Mars",
            surfaceArea: "144 400 000 km²"),
        PlanetData(
            image: UIImage(named: "Jupiter")!,
            name: "Jupiter",
            surfaceArea: "6,142E10 km²"),
        PlanetData(
            image: UIImage(named: "Saturn")!,
            name: "Saturn",
            surfaceArea: "4,27E10 km²"),
        PlanetData(
            image: UIImage(named: "Uranus")!,
            name: "Uranus",
            surfaceArea: "8,083E9 km²"),
        PlanetData(
            image: UIImage(named: "Neptune")!,
            name: "Neptune",
            surfaceArea: "7,618E9 km²")
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
