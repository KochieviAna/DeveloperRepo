//
//  CategoriesViewController.swift
//  Assignment35
//
//  Created by MacBook on 27.12.24.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    private lazy var movieButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Movies", for: .normal)
        button.addAction(UIAction(handler: { [weak self] _ in
            self?.movieButtonTapped()
        }), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var bookButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Books", for: .normal)
        button.addAction(UIAction(handler: { [weak self] _ in
            self?.bookButtonTapped()
        }), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var animeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Anime", for: .normal)
        button.addAction(UIAction(handler: { [weak self] _ in
            self?.animeButtonTapped()
        }), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [movieButton, bookButton, animeButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(stackView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            movieButton.heightAnchor.constraint(equalToConstant: 50),
            
            bookButton.heightAnchor.constraint(equalToConstant: 50),
            
            animeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func movieButtonTapped() {
        let movieRiddlesVC = RiddlesViewController(category: .movies)
        navigationController?.pushViewController(movieRiddlesVC, animated: true)
    }
    
    private func bookButtonTapped() {
        let bookRiddlesVC = RiddlesViewController(category: .books)
        navigationController?.pushViewController(bookRiddlesVC, animated: true)
    }
    
    private func animeButtonTapped() {
        let animeRiddlesVC = RiddlesViewController(category: .anime)
        navigationController?.pushViewController(animeRiddlesVC, animated: true)
    }
}
