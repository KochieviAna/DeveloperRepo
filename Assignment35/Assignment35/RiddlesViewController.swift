//
//  RiddlesViewController.swift
//  Assignment35
//
//  Created by MacBook on 27.12.24.
//

import UIKit
import SwiftUI

class RiddlesViewController: UIViewController {
    
    var category: Category
    
    private lazy var riddleView: RiddleView = {
        let viewModel = RiddleViewModel(category: category)
        
        return RiddleView(viewModel: viewModel)
    }()
    
    private lazy var hostingController: UIHostingController<RiddleView> = {
        let hostingController = UIHostingController(rootView: riddleView)
        
        return hostingController
    }()
    
    init(category: Category) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        addChild(hostingController)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(hostingController.view)
        
        hostingController.didMove(toParent: self)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
