//
//  QuizPageVC.swift
//  Assignment21
//
//  Created by MacBook on 03.11.24.
//

import UIKit
import SnapKit

final class QuizPageVC: UIViewController {
    
    private lazy var quizTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.register(QuizPageCell.self, forCellReuseIdentifier: QuizPageCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func setupUI() {
        addDiagonalGradientBackground(to: view)
        
        let headerView = QuizPageHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 70))
        quizTableView.tableHeaderView = headerView
        
        view.addSubview(quizTableView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        quizTableView.snp.remakeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(21 * Constraint.xCoeff)
            make.trailing.equalToSuperview().offset(-21 * Constraint.xCoeff)
        }
    }
}

extension QuizPageVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuizPageCell.identifier, for: indexPath) as? QuizPageCell else { return UITableViewCell() }
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        61
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = QuestionPageVC()
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
