//
//  ViewController.swift
//  Assignment12
//
//  Created by MacBook on 09.10.24.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: UI Components
    
    @IBOutlet private weak var wrapperView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        modifyingUI()
    }
    
    private func modifyingUI() {
        wrapperView.layer.cornerRadius = 30
    }
    
}

