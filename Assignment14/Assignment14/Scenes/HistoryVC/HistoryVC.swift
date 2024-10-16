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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    
    private func setupUI() {
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = customBackButton
    }
    
    private func backButtonTapped() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .push
        transition.subtype = .fromRight
        navigationController?.view.layer.add(transition, forKey: kCATransition)
        navigationController?.popViewController(animated: false)    }
}
