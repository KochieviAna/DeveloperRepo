//
//  PlanetListVC+DataSource+Delegate.swift
//  Assignment17
//
//  Created by MacBook on 21.10.24.
//

import UIKit

extension PlanetListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        planetData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanetListCell", for: indexPath) as? PlanetListCell else {
            return UICollectionViewCell()
        }
        
        let cellData = planetData[indexPath.item]
        cell.configureCell(with: cellData)
        cell.backgroundColor = .clear
        return cell
    }
}

extension PlanetListVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let planetData = planetData[indexPath.item]
        let vc = PlanetDetailsVC()
        vc.planetName = planetData.name
        vc.planetImage = planetData.image
        vc.area = planetData.surfaceArea
        vc.temperature = planetData.temperature
        vc.mass = planetData.mass
        vc.favorite = planetData.isFavoutite
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension PlanetListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let collectionViewWidth = collectionView.bounds.width
           
           let totalSpacing: CGFloat = 30
           let cellWidth = (collectionViewWidth - totalSpacing) / 2
           let cellHeight: CGFloat = 180
           
           return CGSize(width: cellWidth, height: cellHeight)
       }
}
