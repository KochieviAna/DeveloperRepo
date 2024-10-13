//
//  CalculatorVC.swift
//  Assignment14
//
//  Created by MacBook on 13.10.24.
//

import UIKit

final class CalculatorVC: UIViewController {
    
    private lazy var equationLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.arimoRegular(size: 20)
        label.textColor = UIColor(hexString: "637381")
        label.text = "120 x 3 + 608 + 1080"
        return label
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.arimoBold(size: 48)
        label.textColor = UIColor(hexString: "1E1E1E")
        label.text = "2,048"
        return label
    }()
    
    private lazy var wrapperView: UIView = {
        let view = UIView(frame: .zero)
        view.layer.cornerRadius = 30
        view.backgroundColor = UIColor(hexString: "F5F5F5")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        view.addSubview(equationLabel)
        view.addSubview(resultLabel)
        view.addSubview(wrapperView)
    }
    
    private func setupConstraints() {
        equationLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            equationLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 158),
            equationLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -43)
        ])
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: equationLabel.bottomAnchor, constant: 8),
            resultLabel.trailingAnchor.constraint(equalTo: equationLabel.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            wrapperView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 40),
            wrapperView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            wrapperView.leftAnchor.constraint(equalTo: view.leftAnchor),
            wrapperView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}

