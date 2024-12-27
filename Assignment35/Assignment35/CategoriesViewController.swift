//
//  CategoriesViewController.swift
//  Assignment35
//
//  Created by MacBook on 27.12.24.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.title = "Emoji Riddle Categories"
        
        let movieButton = createButton(title: "Movies", action: { [weak self] in
            guard let self = self else { return }
            let movieRiddlesVC = RiddlesViewController(category: .movies)
            self.navigationController?.pushViewController(movieRiddlesVC, animated: true)
        })
        
        let bookButton = createButton(title: "Books", action: { [weak self] in
            guard let self = self else { return }
            let bookRiddlesVC = RiddlesViewController(category: .books)
            self.navigationController?.pushViewController(bookRiddlesVC, animated: true)
        })
        
        let animeButton = createButton(title: "Anime", action: { [weak self] in
            guard let self = self else { return }
            let animeRiddlesVC = RiddlesViewController(category: .anime)
            self.navigationController?.pushViewController(animeRiddlesVC, animated: true)
        })
        
        let stackView = UIStackView(arrangedSubviews: [movieButton, bookButton, animeButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    func createButton(title: String, action: @escaping () -> Void) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.addAction(UIAction(handler: { [weak self] _ in
            action()
        }), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }
}
