//
//  PlanetVC+Delegate+DataSource.swift
//  Assignment16
//
//  Created by MacBook on 18.10.24.
//

import UIKit

extension PlanetListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        planetData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetCell", for: indexPath) as? PlanetCell else { return UITableViewCell() }
        let planetData = planetData[indexPath.row]
        cell.configureCell(with: planetData)
        cell.backgroundColor = .clear
        return cell
    }
}

extension PlanetListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PlanetDetailsVC()
        let planetData = planetData[indexPath.row]
        vc.planetName = planetData.name
        vc.planetImage = planetData.image
        vc.area = planetData.surfaceArea
        vc.temperature = planetData.temperature
        vc.mass = planetData.mass
        navigationController?.pushViewController(vc, animated: true)
    }
}
