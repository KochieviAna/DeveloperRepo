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
        view.layer.cornerRadius = 32
        view.backgroundColor = UIColor(hexString: "F5F5F5")
        return view
    }()
    
    private lazy var darkModeButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 32
        button.backgroundColor = .clear
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemGray5.cgColor
        button.tintColor = .systemPink
        button.setImage(UIImage(systemName: "moon"), for: .normal)
        return button
    }()
    
    private lazy var sevenButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 32
        button.backgroundColor = .clear
        button.setTitle("7", for: .normal)
        button.setTitleColor(UIColor(hexString: "1E1E1E"), for: .normal)
        button.titleLabel?.font = UIFont.arimoRegular(size: 24)
        return button
    }()
    
    private lazy var fourButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 32
        button.backgroundColor = .clear
        button.setTitle("4", for: .normal)
        button.setTitleColor(UIColor(hexString: "1E1E1E"), for: .normal)
        button.titleLabel?.font = UIFont.arimoRegular(size: 24)
        return button
    }()
    
    private lazy var oneButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 32
        button.backgroundColor = .clear
        button.setTitle("1", for: .normal)
        button.setTitleColor(UIColor(hexString: "1E1E1E"), for: .normal)
        button.titleLabel?.font = UIFont.arimoRegular(size: 24)
        return button
    }()
    
    private lazy var aCButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 32
        button.backgroundColor = .clear
        button.setTitle("AC", for: .normal)
        button.setTitleColor(.systemPink, for: .normal)
        button.titleLabel?.font = UIFont.arimoRegular(size: 24)
        return button
    }()
    
    private lazy var percentageButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 32
        button.backgroundColor = .systemGray5
        button.tintColor = UIColor(hexString: "1E1E1E")
        button.setImage(UIImage(systemName: "percent"), for: .normal)
        return button
    }()
    
    private lazy var eightButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 32
        button.backgroundColor = .clear
        button.setTitle("8", for: .normal)
        button.setTitleColor(UIColor(hexString: "1E1E1E"), for: .normal)
        button.titleLabel?.font = UIFont.arimoRegular(size: 24)
        return button
    }()
    
    private lazy var fiveButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 32
        button.backgroundColor = .clear
        button.setTitle("5", for: .normal)
        button.setTitleColor(UIColor(hexString: "1E1E1E"), for: .normal)
        button.titleLabel?.font = UIFont.arimoRegular(size: 24)
        return button
    }()
    
    private lazy var twoButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 32
        button.backgroundColor = .clear
        button.setTitle("2", for: .normal)
        button.setTitleColor(UIColor(hexString: "1E1E1E"), for: .normal)
        button.titleLabel?.font = UIFont.arimoRegular(size: 24)
        return button
    }()
    
    private lazy var zeroButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 32
        button.backgroundColor = .clear
        button.setTitle("0", for: .normal)
        button.setTitleColor(UIColor(hexString: "1E1E1E"), for: .normal)
        button.titleLabel?.font = UIFont.arimoRegular(size: 24)
        return button
    }()
    
    private lazy var divisionButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 32
        button.backgroundColor = .systemGray5
        button.tintColor = UIColor(hexString: "1E1E1E")
        button.setImage(UIImage(systemName: "divide"), for: .normal)
        return button
    }()
    
    private lazy var nineButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 32
        button.backgroundColor = .clear
        button.setTitle("9", for: .normal)
        button.setTitleColor(UIColor(hexString: "1E1E1E"), for: .normal)
        button.titleLabel?.font = UIFont.arimoRegular(size: 24)
        return button
    }()
    
    private lazy var sixButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 32
        button.backgroundColor = .clear
        button.setTitle("6", for: .normal)
        button.setTitleColor(UIColor(hexString: "1E1E1E"), for: .normal)
        button.titleLabel?.font = UIFont.arimoRegular(size: 24)
        return button
    }()
    
    private lazy var threeButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 32
        button.backgroundColor = .clear
        button.setTitle("3", for: .normal)
        button.setTitleColor(UIColor(hexString: "1E1E1E"), for: .normal)
        button.titleLabel?.font = UIFont.arimoRegular(size: 24)
        return button
    }()
    
    private lazy var dotButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 32
        button.backgroundColor = .clear
        button.setTitle(".", for: .normal)
        button.setTitleColor(UIColor(hexString: "1E1E1E"), for: .normal)
        button.titleLabel?.font = UIFont.arimoRegular(size: 24)
        return button
    }()
    
    private lazy var multiplyButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 32
        button.backgroundColor = .systemGray5
        button.tintColor = UIColor(hexString: "1E1E1E")
        button.setImage(UIImage(systemName: "multiply"), for: .normal)
        return button
    }()
    
    private lazy var minusButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 32
        button.backgroundColor = .systemGray5
        button.tintColor = UIColor(hexString: "1E1E1E")
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        return button
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 32
        button.backgroundColor = .systemGray5
        button.tintColor = UIColor(hexString: "1E1E1E")
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        return button
    }()
    
    private lazy var equalButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 32
        button.backgroundColor = .systemPink
        button.tintColor = .white
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 22, weight: .regular, scale: .large)
        let largeEqualImage = UIImage(systemName: "equal", withConfiguration: largeConfig)
        button.setImage(largeEqualImage, for: .normal)
        return button
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
        view.addSubview(darkModeButton)
        view.addSubview(sevenButton)
        view.addSubview(fourButton)
        view.addSubview(oneButton)
        view.addSubview(aCButton)
        view.addSubview(percentageButton)
        view.addSubview(eightButton)
        view.addSubview(fiveButton)
        view.addSubview(twoButton)
        view.addSubview(zeroButton)
        view.addSubview(divisionButton)
        view.addSubview(nineButton)
        view.addSubview(sixButton)
        view.addSubview(threeButton)
        view.addSubview(dotButton)
        view.addSubview(multiplyButton)
        view.addSubview(minusButton)
        view.addSubview(plusButton)
        view.addSubview(equalButton)
    }
    
    private func setupConstraints() {
        equationLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.translatesAutoresizingMaskIntoConstraints = false
        darkModeButton.translatesAutoresizingMaskIntoConstraints = false
        sevenButton.translatesAutoresizingMaskIntoConstraints = false
        fourButton.translatesAutoresizingMaskIntoConstraints = false
        oneButton.translatesAutoresizingMaskIntoConstraints = false
        aCButton.translatesAutoresizingMaskIntoConstraints = false
        percentageButton.translatesAutoresizingMaskIntoConstraints = false
        eightButton.translatesAutoresizingMaskIntoConstraints = false
        fiveButton.translatesAutoresizingMaskIntoConstraints = false
        twoButton.translatesAutoresizingMaskIntoConstraints = false
        zeroButton.translatesAutoresizingMaskIntoConstraints = false
        divisionButton.translatesAutoresizingMaskIntoConstraints = false
        nineButton.translatesAutoresizingMaskIntoConstraints = false
        sixButton.translatesAutoresizingMaskIntoConstraints = false
        threeButton.translatesAutoresizingMaskIntoConstraints = false
        dotButton.translatesAutoresizingMaskIntoConstraints = false
        multiplyButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        equalButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            equationLabel.topAnchor.constraint(lessThanOrEqualTo: view.topAnchor, constant: 158),
            equationLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -43)
        ])
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: equationLabel.bottomAnchor, constant: 8),
            resultLabel.trailingAnchor.constraint(equalTo: equationLabel.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            wrapperView.topAnchor.constraint(lessThanOrEqualTo: resultLabel.bottomAnchor, constant: 40),
            wrapperView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            wrapperView.leftAnchor.constraint(equalTo: view.leftAnchor),
            wrapperView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            darkModeButton.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 48),
            darkModeButton.leftAnchor.constraint(lessThanOrEqualTo: wrapperView.leftAnchor, constant: 43),
            darkModeButton.heightAnchor.constraint(equalToConstant: 64),
            darkModeButton.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([
            sevenButton.topAnchor.constraint(equalTo: darkModeButton.bottomAnchor, constant: 16),
            sevenButton.leadingAnchor.constraint(equalTo: darkModeButton.leadingAnchor),
            sevenButton.heightAnchor.constraint(equalToConstant: 64),
            sevenButton.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([
            fourButton.topAnchor.constraint(equalTo: sevenButton.bottomAnchor, constant: 16),
            fourButton.leadingAnchor.constraint(equalTo: sevenButton.leadingAnchor),
            fourButton.heightAnchor.constraint(equalToConstant: 64),
            fourButton.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([
            oneButton.topAnchor.constraint(equalTo: fourButton.bottomAnchor, constant: 16),
            oneButton.leadingAnchor.constraint(equalTo: fourButton.leadingAnchor),
            oneButton.heightAnchor.constraint(equalToConstant: 64),
            oneButton.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([
            aCButton.topAnchor.constraint(equalTo: oneButton.bottomAnchor, constant: 16),
            aCButton.leadingAnchor.constraint(equalTo: oneButton.leadingAnchor),
            aCButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            aCButton.heightAnchor.constraint(equalToConstant: 64),
            aCButton.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([
            percentageButton.topAnchor.constraint(equalTo: darkModeButton.topAnchor),
            percentageButton.leadingAnchor.constraint(equalTo: darkModeButton.trailingAnchor, constant: 16),
            percentageButton.heightAnchor.constraint(equalToConstant: 64),
            percentageButton.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([
            eightButton.topAnchor.constraint(equalTo: percentageButton.bottomAnchor, constant: 16),
            eightButton.leadingAnchor.constraint(equalTo: percentageButton.leadingAnchor),
            eightButton.heightAnchor.constraint(equalToConstant: 64),
            eightButton.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([
            fiveButton.topAnchor.constraint(equalTo: eightButton.bottomAnchor, constant: 16),
            fiveButton.leadingAnchor.constraint(equalTo: eightButton.leadingAnchor),
            fiveButton.heightAnchor.constraint(equalToConstant: 64),
            fiveButton.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([
            twoButton.topAnchor.constraint(equalTo: fiveButton.bottomAnchor, constant: 16),
            twoButton.leadingAnchor.constraint(equalTo: fiveButton.leadingAnchor),
            twoButton.heightAnchor.constraint(equalToConstant: 64),
            twoButton.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([
            zeroButton.topAnchor.constraint(equalTo: twoButton.bottomAnchor, constant: 16),
            zeroButton.leadingAnchor.constraint(equalTo: twoButton.leadingAnchor),
            zeroButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            zeroButton.heightAnchor.constraint(equalToConstant: 64),
            zeroButton.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([
            divisionButton.topAnchor.constraint(equalTo: percentageButton.topAnchor),
            divisionButton.leadingAnchor.constraint(equalTo: percentageButton.trailingAnchor, constant: 16),
            divisionButton.heightAnchor.constraint(equalToConstant: 64),
            divisionButton.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([
            nineButton.topAnchor.constraint(equalTo: divisionButton.bottomAnchor, constant: 16),
            nineButton.leadingAnchor.constraint(equalTo: divisionButton.leadingAnchor),
            nineButton.heightAnchor.constraint(equalToConstant: 64),
            nineButton.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([
            sixButton.topAnchor.constraint(equalTo: nineButton.bottomAnchor, constant: 16),
            sixButton.leadingAnchor.constraint(equalTo: nineButton.leadingAnchor),
            sixButton.heightAnchor.constraint(equalToConstant: 64),
            sixButton.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([
            threeButton.topAnchor.constraint(equalTo: sixButton.bottomAnchor, constant: 16),
            threeButton.leadingAnchor.constraint(equalTo: sixButton.leadingAnchor),
            threeButton.heightAnchor.constraint(equalToConstant: 64),
            threeButton.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([
            dotButton.topAnchor.constraint(equalTo: threeButton.bottomAnchor, constant: 16),
            dotButton.leadingAnchor.constraint(equalTo: threeButton.leadingAnchor),
            dotButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            dotButton.heightAnchor.constraint(equalToConstant: 64),
            dotButton.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([
            multiplyButton.topAnchor.constraint(equalTo: divisionButton.topAnchor),
            multiplyButton.leadingAnchor.constraint(equalTo: divisionButton.trailingAnchor, constant: 16),
            multiplyButton.trailingAnchor.constraint(equalTo: resultLabel.trailingAnchor),
            multiplyButton.heightAnchor.constraint(equalToConstant: 64),
            multiplyButton.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([
            minusButton.topAnchor.constraint(equalTo: multiplyButton.bottomAnchor, constant: 16),
            minusButton.leadingAnchor.constraint(equalTo: multiplyButton.leadingAnchor),
            minusButton.trailingAnchor.constraint(equalTo: multiplyButton.trailingAnchor),
            minusButton.heightAnchor.constraint(equalToConstant: 64),
            minusButton.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([
            plusButton.topAnchor.constraint(equalTo: minusButton.bottomAnchor, constant: 16),
            plusButton.leadingAnchor.constraint(equalTo: minusButton.leadingAnchor),
            plusButton.trailingAnchor.constraint(equalTo: minusButton.trailingAnchor),
            plusButton.heightAnchor.constraint(equalToConstant: 64),
            plusButton.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([
            equalButton.topAnchor.constraint(equalTo: plusButton.bottomAnchor, constant: 16),
            equalButton.leadingAnchor.constraint(equalTo: plusButton.leadingAnchor),
            equalButton.trailingAnchor.constraint(equalTo: plusButton.trailingAnchor),
            equalButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            equalButton.heightAnchor.constraint(equalToConstant: 144),
            equalButton.widthAnchor.constraint(equalToConstant: 64)
        ])
    }
}






