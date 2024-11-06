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
    
    private lazy var questionLabel: PaddedLabel = {
        let label = PaddedLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .senMedium(size: 14)
        label.textAlignment = .center
        label.textColor = UIColor(hexString: "FFFFFF")
        label.backgroundColor = UIColor(hexString: "8E84FF")
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(hexString: "B8B2FF").cgColor
        label.clipsToBounds = true
        label.leftInset = 10
        label.rightInset = 10
        
        return label
    }()
    
    private lazy var questionTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.register(QuestionPageCell.self, forCellReuseIdentifier: QuestionPageCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsMultipleSelection = false
        
        return tableView
    }()
    
    var question: Question?
    private var shuffledAnswers: [String] = []
    var questionLabelText: String?
    var heatherLabelText: String?
    
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
        configureQuestionAndAnswers()
        setupFooterView()
    }
    
    private func setupHeaderView() {
        let headerView = QuestionPageHeaderView()
        headerView.headerLabel.text = heatherLabelText
        
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
            questionLabel.leadingAnchor.constraint(greaterThanOrEqualTo: backArrowButton.trailingAnchor, constant: 10),
            questionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            questionLabel.heightAnchor.constraint(equalToConstant: 34)
        ])
        
        NSLayoutConstraint.activate([
            questionTableView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 25),
            questionTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            questionTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            questionTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureQuestionAndAnswers() {
        guard let question = question else { return }
        
        questionLabel.text = "Question \(questionLabelText ?? "")"
        shuffledAnswers = ([question.correctAnswer] + question.incorrectAnswers).shuffled()
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
        return shuffledAnswers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuestionPageCell.identifier, for: indexPath) as? QuestionPageCell else { return UITableViewCell() }
        cell.backgroundColor = .clear
        cell.configureCell(with: shuffledAnswers[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? QuestionPageCell {
            cell.updateSelectionAppearance(isSelected: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        57
    }
}
