//
//  StartViewController.swift
//  Assignment25
//
//  Created by MacBook on 15.11.24.
//

import UIKit

final class StartViewController: UIViewController {
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 60, weight: .semibold)
        button.backgroundColor = .clear
        button.setTitleColor(.systemOrange, for: .normal)
        button.addAction(UIAction(handler: { [ weak self ] action in
            self?.startButtonTapped()
        }), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(startButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startButton.heightAnchor.constraint(equalToConstant: 200),
            startButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func startButtonTapped() {
        navigationController?.pushViewController(GameViewController(), animated: false)
    }
}
