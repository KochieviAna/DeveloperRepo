//
//  PlanetVC+Extensions.swift
//  Assignment16
//
//  Created by MacBook on 18.10.24.
//

import UIKit

extension PlanetListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetCell", for: indexPath) as! PlanetCell
        return cell
    }
}

extension PlanetListVC: UITableViewDelegate {
    
}
