//
//  ViewController.swift
//  Assignment19
//
//  Created by MacBook on 30.10.24.
//

import UIKit

final class HomePageVC: UIViewController {
    
    private lazy var latestNewsLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Latest News"
        titleLabel.textColor = UIColor(hexString: "000000")
        titleLabel.font = UIFont(name: "AnekDevanagari-Bold", size: 17)
        titleLabel.textAlignment = .center
        
        return titleLabel
    }()
    
    private lazy var homePageCollectionVIew: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HomePageCell.self, forCellWithReuseIdentifier: HomePageCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.layer.cornerRadius = 10
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    private let homePageViewModel = HomePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.titleView = latestNewsLabel
        setupUI()
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
}

extension HomePageVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homePageViewModel.newsData?.articles?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePageCell.identifier, for: indexPath) as? HomePageCell else {
            return UICollectionViewCell()
        }
        
        if let article = homePageViewModel.newsData?.articles?[indexPath.item] {
            cell.configureCell(with: article)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let totalSpacing: CGFloat = 16
        let cellWidth = (collectionViewWidth - totalSpacing) / 2
        let cellHeight: CGFloat = 128
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
