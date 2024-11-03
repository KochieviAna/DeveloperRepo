//
//  ViewController.swift
//  Assignment21
//
//  Created by MacBook on 03.11.24.
//

import UIKit
import SnapKit

class LogInPageVC: UIViewController {
    
    private lazy var imageWrapperImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "circle.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = UIColor(hexString: "FFFFFF")
        
        return imageView
    }()
    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.crop.circle.fill.badge.plus")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = UIColor(hexString: "060B26")
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        addDiagonalGradientBackground(to: view)
        
        view.addSubview(imageWrapperImage)
        imageWrapperImage.addSubview(userImageView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageWrapperImage.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(79 * Constraint.yCoeff)
            make.centerX.equalToSuperview()
            make.height.equalTo(98.21 * Constraint.yCoeff)
            make.width.equalTo(104 * Constraint.xCoeff)
        }
        
        userImageView.snp.remakeConstraints { make in
            make.top.equalTo(imageWrapperImage.snp.top).offset(22.27 * Constraint.yCoeff)
            make.leading.equalTo(imageWrapperImage.snp.leading).offset(13.94 * Constraint.xCoeff)
            make.trailing.equalTo(imageWrapperImage.snp.trailing).offset(-15.37 * Constraint.xCoeff)
            make.bottom.equalTo(imageWrapperImage.snp.bottom).offset(-22.48 * Constraint.yCoeff)
            make.height.equalTo(53.45 * Constraint.yCoeff)
            make.width.equalTo(74.69 * Constraint.xCoeff)
        }
    }
}

