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
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.layer.cornerRadius = 10
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
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let cellWidth = collectionViewWidth - 16
        let cellHeight: CGFloat = 128
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
