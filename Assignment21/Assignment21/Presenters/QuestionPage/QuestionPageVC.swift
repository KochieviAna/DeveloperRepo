//
//  QuestionPageVC.swift
//  Assignment21
//
//  Created by MacBook on 03.11.24.
//

import UIKit
import SnapKit

class QuestionPageVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        addDiagonalGradientBackground(to: view)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
    }
}
