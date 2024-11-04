//
//  QuestionPageVC.swift
//  Assignment21
//
//  Created by MacBook on 03.11.24.
//

import UIKit
import SnapKit

final class QuestionPageVC: UIViewController {
    
    private lazy var backArrowButton: UIButton = {
        let button = UIButton()
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
        backArrowButton.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(71 * Constraint.yCoeff)
            make.leading.equalToSuperview().offset(22 * Constraint.xCoeff)
            make.height.equalTo(10.59 * Constraint.yCoeff)
            make.width.equalTo(6.09 * Constraint.xCoeff)
        }
        
        questionLabel.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(65 * Constraint.yCoeff)
            make.leading.lessThanOrEqualTo(backArrowButton.snp.trailing).offset(203.91 * Constraint.xCoeff)
            make.trailing.equalToSuperview().offset(-24 * Constraint.xCoeff)
            make.height.equalTo(34 * Constraint.yCoeff)
            make.width.greaterThanOrEqualTo(81 * Constraint.xCoeff)
        }
        
        questionTableView.snp.remakeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(25 * Constraint.yCoeff)
            make.leading.equalToSuperview().offset(10 * Constraint.xCoeff)
            make.trailing.equalToSuperview().offset(-10 * Constraint.xCoeff)
            make.bottom.equalToSuperview()
        }
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
