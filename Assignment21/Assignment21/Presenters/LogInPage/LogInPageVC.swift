//
//  ViewController.swift
//  Assignment21
//
//  Created by MacBook on 03.11.24.
//

import UIKit

final class LogInPageVC: UIViewController {
    
    private lazy var imageWrapperImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "circle.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = UIColor(hexString: "FFFFFF")
        
        return imageView
    }()
    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person.crop.circle.fill.badge.plus")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = UIColor(hexString: "060B26")
        
        return imageView
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Username"
        label.font = .senRegular(size: 16)
        label.textColor = UIColor(hexString: "FFFFFF")
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.placeholder = "Enter username"
        textField.font = .senMedium(size: 11)
        textField.textColor = UIColor(hexString: "2B0063")
        textField.borderStyle = .none
        textField.layer.cornerRadius = 12
        textField.keyboardType = .default
        textField.textContentType = .username
        textField.backgroundColor = UIColor(hexString: "FFFFFF")
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password"
        label.font = .senRegular(size: 16)
        label.textColor = UIColor(hexString: "FFFFFF")
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.placeholder = "Enter password"
        textField.font = .senMedium(size: 11)
        textField.textColor = UIColor(hexString: "2B0063")
        textField.borderStyle = .none
        textField.layer.cornerRadius = 12
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.backgroundColor = UIColor(hexString: "FFFFFF")
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private lazy var confirmPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Confirm password"
        label.font = .senRegular(size: 16)
        label.textColor = UIColor(hexString: "FFFFFF")
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.placeholder = "Enter password"
        textField.font = .senMedium(size: 11)
        textField.textColor = UIColor(hexString: "2B0063")
        textField.borderStyle = .none
        textField.layer.cornerRadius = 12
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.backgroundColor = UIColor(hexString: "FFFFFF")
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor(hexString: "FFFFFF"), for: .normal)
        button.backgroundColor = UIColor(hexString: "8E84FF")
        button.layer.cornerRadius = 12
        button.addAction(UIAction(handler: { [ weak self ] action in
            self?.signinButtonTapped()
        }), for: .touchUpInside)
        
        return button
    }()
    
    private let loginPageiewModel = LoginPageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        addDiagonalGradientBackground(to: view)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))
        
        view.addSubview(imageWrapperImage)
        imageWrapperImage.addSubview(userImageView)
        view.addSubview(usernameLabel)
        view.addSubview(usernameTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPasswordLabel)
        view.addSubview(confirmPasswordTextField)
        view.addSubview(loginButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageWrapperImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35),
            imageWrapperImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageWrapperImage.heightAnchor.constraint(equalToConstant: 98.21),
            imageWrapperImage.widthAnchor.constraint(equalToConstant: 104)
        ])
        
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: imageWrapperImage.topAnchor, constant: 22.27),
            userImageView.leadingAnchor.constraint(equalTo: imageWrapperImage.leadingAnchor, constant: 13.94),
            userImageView.trailingAnchor.constraint(equalTo: imageWrapperImage.trailingAnchor, constant: -15.37),
            userImageView.bottomAnchor.constraint(equalTo: imageWrapperImage.bottomAnchor, constant: -22.48),
            userImageView.heightAnchor.constraint(equalToConstant: 53.45),
            userImageView.widthAnchor.constraint(equalToConstant: 74.69)
        ])
        
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: imageWrapperImage.bottomAnchor, constant: 22.79),
            usernameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 26),
            usernameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -26)
        ])
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 8),
            usernameTextField.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor),
            usernameTextField.trailingAnchor.constraint(equalTo: usernameLabel.trailingAnchor),
            usernameTextField.heightAnchor.constraint(equalToConstant: 41)
        ])
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 13),
            passwordLabel.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordLabel.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 41)
        ])
        
        NSLayoutConstraint.activate([
            confirmPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 13),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            confirmPasswordLabel.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            confirmPasswordTextField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 8),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: confirmPasswordLabel.leadingAnchor),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: confirmPasswordLabel.trailingAnchor),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 41)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(greaterThanOrEqualTo: confirmPasswordTextField.bottomAnchor, constant: 78),
            loginButton.leadingAnchor.constraint(equalTo: confirmPasswordTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: confirmPasswordTextField.trailingAnchor),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            loginButton.heightAnchor.constraint(equalToConstant: 42)
        ])
    }
    
    private func signinButtonTapped() {
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showErrorAlert(message: "Please enter username and password.")
            return
        }
        
        if loginPageiewModel.userExists(username: username) {
            if let storedPassword = loginPageiewModel.fetchPassword(for: username), storedPassword == password {
                pushToQuizPage()
            } else if confirmPasswordTextField.text?.isEmpty == false {
                showErrorAlert(message: "Username already exists.")
            } else {
                showErrorAlert(message: "Incorrect password.")
            }
            return
        }
        
        guard let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty else {
            showErrorAlert(message: "Please confirm your password.")
            return
        }
        
        if !loginPageiewModel.isPasswordValid(password) {
            showErrorAlert(message: "Password must be at least 8 characters long, contain one uppercase letter, one lowercase letter, one digit, and one special character.")
            return
        }
        
        if password != confirmPassword {
            showErrorAlert(message: "Passwords do not match.")
            return
        }
        
        if loginPageiewModel.saveUser(username: username, password: password) {
            pushToQuizPage()
        } else {
            showErrorAlert(message: "Failed to save user data.")
        }
    }
    
    private func pushToQuizPage() {
        let quizPageVC = QuizPageVC()
        navigationController?.pushViewController(quizPageVC, animated: true)
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
}


extension LogInPageVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
