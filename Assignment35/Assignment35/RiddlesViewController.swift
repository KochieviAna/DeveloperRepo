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
    
    init(category: Category) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewModel = RiddleViewModel(category: category)
        let riddleView = RiddleView(viewModel: viewModel)
        
        let hostingController = UIHostingController(rootView: riddleView)
        addChild(hostingController)
        hostingController.view.frame = view.bounds
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
}
