//
//  HistoryVC.swift
//  Assignment14
//
//  Created by MacBook on 16.10.24.
//

import UIKit

final class HistoryVC: UIViewController {
    
    private lazy var customBackButton: UIBarButtonItem = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrowshape.backward.circle"), for: .normal)
        button.tintColor = UIColor(hexString: "1E1E1E")
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.imageView?.contentMode = .scaleAspectFit
        button.addAction(UIAction(handler: { [weak self] action in
            self?.backButtonTapped()
        }), for: .touchUpInside)
        let barButtonItem = UIBarButtonItem(customView: button)
        return barButtonItem
    }()
    
    private let historyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .right
        label.font = UIFont.arimoRegular(size: 20)
        label.textColor = UIColor(hexString: "000000")
        return label
    }()
    
    var history: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "History"
        setupUI()
        setUpConstraints()
        displayHistory()
    }
    
    
    private func setupUI() {
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = customBackButton
        view.addSubview(historyLabel)
    }
    
    private func setUpConstraints() {
        historyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            historyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            historyLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            historyLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            historyLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func backButtonTapped() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .push
        transition.subtype = .fromRight
        navigationController?.view.layer.add(transition, forKey: kCATransition)
        navigationController?.popViewController(animated: false)
    }
    
    private func displayHistory() {
        if history.isEmpty {
            historyLabel.text = "No history available."
        } else {
            historyLabel.text = history.joined(separator: "\n")
        }
    }
}
