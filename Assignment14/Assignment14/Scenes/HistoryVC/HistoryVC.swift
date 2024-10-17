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
    
    private let historyTextView: UITextView = {
        let view = UITextView(frame: .zero)
        view.textAlignment = .right
        view.font = UIFont.arimoRegular(size: 20)
        view.textColor = UIColor(hexString: "000000")
        view.isEditable = false
        return view
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
        view.addSubview(historyTextView)
    }
    
    private func setUpConstraints() {
        historyTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            historyTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            historyTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            historyTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            historyTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
            historyTextView.text = "No history available."
        } else {
            historyTextView.text = history.joined(separator: "\n")
        }
    }
}
