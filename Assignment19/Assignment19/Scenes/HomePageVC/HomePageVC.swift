//
//  ViewController.swift
//  Assignment19
//
//  Created by MacBook on 30.10.24.
//

import UIKit

final class HomePageVC: UIViewController {
    
    private lazy var homePageCollectionVIew: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HomePageCell.self, forCellWithReuseIdentifier: HomePageCell.identifier)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    private var homePageViewModel = HomePageViewModel()
    private var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        setupViewModel()
    }
    
    private func setupUI() {
        view.addSubview(homePageCollectionVIew)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            homePageCollectionVIew.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homePageCollectionVIew.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            homePageCollectionVIew.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            homePageCollectionVIew.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupViewModel() {
        homePageViewModel.onDataUpdated = { [weak self] in
            self?.articles = self?.homePageViewModel.articles ?? []
            DispatchQueue.main.async {
                self?.homePageCollectionVIew.reloadData()
            }
        }
        homePageViewModel.fetchData()
    }
}


extension HomePageVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        homePageViewModel.articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePageCell.identifier, for: indexPath) as? HomePageCell else { return UICollectionViewCell() }
        
        let article = homePageViewModel.articles[indexPath.item]
        cell.configureCell(with: article)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailsPageVC()
        
        let selectedArticle = homePageViewModel.articles[indexPath.item]
        vc.article = selectedArticle
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let cellWidth = collectionViewWidth - 16
        let cellHeight: CGFloat = 128
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath)
            header.backgroundColor = .clear
            
            lazy var headerLabel: UILabel = {
                let headerLabel = UILabel(frame: header.bounds)
                headerLabel.text = "Latest News"
                headerLabel.textAlignment = .left
                headerLabel.font = UIFont(name: "AnekDevanagari-Bold", size: 18)
                headerLabel.textColor = UIColor(hexString: "000000")
                headerLabel.translatesAutoresizingMaskIntoConstraints = false
                
                return headerLabel
            }()
            
            header.subviews.forEach { $0.removeFromSuperview() }
            
            header.addSubview(headerLabel)
            
            NSLayoutConstraint.activate([
                headerLabel.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 16),
                headerLabel.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: -16),
                headerLabel.topAnchor.constraint(equalTo: header.topAnchor, constant: 8),
                headerLabel.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -8)
            ])
            
            return header
        }
        return UICollectionReusableView()
    }
}
