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
        label.font = .oSBold(size: 36)
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(PlanetCell.self, forCellReuseIdentifier: "PlanetCell")
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "210D04")
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        view.addSubview(planetLabel)
    }
    
    private func setupConstraints() {
        planetLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            planetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            planetLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 24)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: planetLabel.bottomAnchor, constant: 60),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
