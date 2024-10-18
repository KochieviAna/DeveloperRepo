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
    
    private let planetData: [PlanetData] = [
        PlanetData(
            image: UIImage(named: "Mercury")!,
            name: "Mercury",
            surfaceArea: 74800000),
        PlanetData(
            image: UIImage(named: "Venus")!,
            name: "Venus",
            surfaceArea: 460200000),
        PlanetData(
            image: UIImage(named: "Earth")!,
            name: "Earth",
            surfaceArea: 510100000),
        PlanetData(
            image: UIImage(named: "Mars")!,
            name: "Mars",
            surfaceArea: 144400000),
        PlanetData(
            image: UIImage(named: "Jupiter")!,
            name: "Jupiter",
            surfaceArea: 61420000000),
        PlanetData(
            image: UIImage(named: "Saturn")!,
            name: "Saturn",
            surfaceArea: 42700000000),
        PlanetData(
            image: UIImage(named: "Uranus")!,
            name: "Uranus",
            surfaceArea: 8083000000),
        PlanetData(
            image: UIImage(named: "Neptune")!,
            name: "Neptune",
            surfaceArea: 7618000000)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("PlanetListVC Loaded")
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
            planetLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 24),
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: planetLabel.bottomAnchor, constant: 60),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension PlanetListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        planetData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetCell", for: indexPath) as? PlanetCell else { return UITableViewCell() }
        let planetData = planetData[indexPath.row]
        print("Loading cell for planet: \(planetData.name)")
        cell.configureCell(with: planetData)
        cell.backgroundColor = .clear
        return cell
    }
}

extension PlanetListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
