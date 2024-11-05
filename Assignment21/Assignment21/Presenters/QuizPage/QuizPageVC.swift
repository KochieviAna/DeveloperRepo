//
//  QuizPageVC.swift
//  Assignment21
//
//  Created by MacBook on 03.11.24.
//

import UIKit

final class QuizPageVC: UIViewController {
    
    private lazy var quizTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.register(QuizPageCell.self, forCellReuseIdentifier: QuizPageCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    private let quizPageViewModel = QuizPageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
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
        NSLayoutConstraint.activate([
            quizTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            quizTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            quizTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 21),
            quizTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -21)
        ])
    }
    
    private func loadData() {
        quizPageViewModel.saveDataFromPath()
        quizPageViewModel.loadQuizData()
    }
    
    private func setupQuizViewModel() {
        quizPageViewModel.onDataUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.quizTableView.reloadData()
            }
        }
    }
}

extension QuizPageVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizPageViewModel.numberOfQuestions
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuizPageCell.identifier, for: indexPath) as? QuizPageCell else { return UITableViewCell() }
        cell.backgroundColor = .clear
        
        let question = quizPageViewModel.questions(at: indexPath.row)
        cell.configure(with: question)
        
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
