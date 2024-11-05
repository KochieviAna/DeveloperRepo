//
//  QuestionPageVC.swift
//  Assignment21
//
//  Created by MacBook on 03.11.24.
//

import UIKit

final class QuestionPageVC: UIViewController {
    
    private lazy var backArrowButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(weight: .bold)
        let boldImage = UIImage(systemName: "chevron.backward", withConfiguration: configuration)
        button.setImage(boldImage, for: .normal)
        button.tintColor = UIColor(hexString: "FFFFFF")
        button.addAction(UIAction(handler: { [ weak self ] action in
            self?.arrowBackButtonTapped()
        }), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .senMedium(size: 14)
        label.textAlignment = .center
        label.textColor = UIColor(hexString: "FFFFFF")
        label.backgroundColor = UIColor(hexString: "8E84FF")
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(hexString: "B8B2FF").cgColor
        label.clipsToBounds = true
        
        return label
    }()
    
    private lazy var questionTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.register(QuestionPageCell.self, forCellReuseIdentifier: QuestionPageCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        questionLabel.layer.cornerRadius = questionLabel.frame.height / 2
    }
    
    
    private func setupUI() {
        addDiagonalGradientBackground(to: view)
        
        view.addSubview(backArrowButton)
        view.addSubview(questionLabel)
        view.addSubview(questionTableView)
        
        setupHeaderView()
        setupConstraints()
        setupFooterView()
    }
    
    private func setupHeaderView() {
        let headerView = QuestionPageHeaderView()
        headerView.headerLabel.text = "How would you describe your level of satisfaction with the healthcare system?"
        
        headerView.layoutIfNeeded()
        var headerFrame = headerView.frame
        headerFrame.size.height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        headerView.frame = headerFrame
        
        questionTableView.tableHeaderView = headerView
        questionTableView.tableHeaderView?.layoutIfNeeded()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 27),
            backArrowButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22),
            backArrowButton.heightAnchor.constraint(equalToConstant: 10.59),
            backArrowButton.widthAnchor.constraint(equalToConstant: 6.09)
        ])
        
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 21),
            questionLabel.leadingAnchor.constraint(lessThanOrEqualTo: backArrowButton.trailingAnchor, constant: 203.91),
            questionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            questionLabel.heightAnchor.constraint(equalToConstant: 34),
            questionLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 81)
        ])
        
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 25),
            questionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            questionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            questionLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupFooterView() {
        let footerView = QuestionPageFooterView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150))
        questionTableView.tableFooterView = footerView
    }
    
    private func arrowBackButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

extension QuestionPageVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuestionPageCell.identifier, for: indexPath) as? QuestionPageCell else { return UITableViewCell() }
        cell.backgroundColor = .clear
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        57
    }
}
