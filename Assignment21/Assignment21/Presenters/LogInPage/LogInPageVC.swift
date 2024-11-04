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
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.font = .SenRegular(size: 16)
        label.textColor = UIColor(hexString: "FFFFFF")
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter username"
        textField.font = .SenMedium(size: 11)
        textField.textColor = UIColor(hexString: "2B0063")
        textField.borderStyle = .none
        textField.layer.cornerRadius = 5
        textField.keyboardType = .default
        textField.textContentType = .username
        textField.backgroundColor = UIColor(hexString: "FFFFFF")
        
        return textField
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = .SenRegular(size: 16)
        label.textColor = UIColor(hexString: "FFFFFF")
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter password"
        textField.font = .SenMedium(size: 11)
        textField.textColor = UIColor(hexString: "2B0063")
        textField.borderStyle = .none
        textField.layer.cornerRadius = 5
        textField.keyboardType = .default
        textField.textContentType = .password
        textField.backgroundColor = UIColor(hexString: "FFFFFF")
        
        return textField
    }()
    
    private lazy var confirmPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Confirm password"
        label.font = .SenRegular(size: 16)
        label.textColor = UIColor(hexString: "FFFFFF")
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter password"
        textField.font = .SenMedium(size: 11)
        textField.textColor = UIColor(hexString: "2B0063")
        textField.borderStyle = .none
        textField.layer.cornerRadius = 5
        textField.keyboardType = .default
        textField.textContentType = .password
        textField.backgroundColor = UIColor(hexString: "FFFFFF")
        
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor(hexString: "FFFFFF"), for: .normal)
        button.backgroundColor = UIColor(hexString: "8E84FF")
        button.layer.cornerRadius = 5
        button.addAction(UIAction(handler: { [ weak self ] action in
            self?.signinButtonTapped()
        }), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        addDiagonalGradientBackground(to: view)
        
        view.addSubview(imageWrapperImage)
        imageWrapperImage.addSubview(userImageView)
        view.addSubview(usernameLabel)
        view.addSubview(usernameTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPasswordLabel)
        view.addSubview(confirmPasswordTextField)
        
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
        
        usernameLabel.snp.remakeConstraints { make in
            make.top.equalTo(imageWrapperImage.snp.bottom).offset(22.79 * Constraint.yCoeff)
            make.leading.equalToSuperview().offset(26 * Constraint.xCoeff)
            make.trailing.equalToSuperview().offset(-26 * Constraint.xCoeff)
        }
        
        usernameTextField.snp.remakeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(8 * Constraint.yCoeff)
            make.leading.equalTo(usernameLabel.snp.leading)
            make.trailing.equalTo(usernameLabel.snp.trailing)
        }
        
        passwordLabel.snp.remakeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(13 * Constraint.yCoeff)
            make.leading.equalTo(usernameTextField.snp.leading)
            make.trailing.equalTo(usernameTextField.snp.trailing)
        }
        
        passwordTextField.snp.remakeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(8 * Constraint.yCoeff)
            make.leading.equalTo(passwordLabel.snp.leading)
            make.trailing.equalTo(passwordLabel.snp.trailing)
        }
        
        confirmPasswordLabel.snp.remakeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(13 * Constraint.yCoeff)
            make.leading.equalTo(passwordTextField.snp.leading)
            make.trailing.equalTo(passwordTextField.snp.trailing)
        }
        
        confirmPasswordTextField.snp.remakeConstraints { make in
            make.top.equalTo(confirmPasswordLabel.snp.bottom).offset(8 * Constraint.yCoeff)
            make.leading.equalTo(confirmPasswordLabel.snp.leading)
            make.trailing.equalTo(confirmPasswordLabel.snp.trailing)
        }
    }
    
    private func signinButtonTapped() {
        let vc = QuizPageVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

