//
//  ViewController.swift
//  Assignment25
//
//  Created by MacBook on 15.11.24.
//

import UIKit

final class GameViewController: UIViewController {
    
    private lazy var monkeyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "monkey")
        imageView.isUserInteractionEnabled = true
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        imageView.addGestureRecognizer(panGesture)
        
        return imageView
    }()
    
    private lazy var bananaImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "banana")
        
        return imageView
    }()
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Score: 0"
        label.textColor = .systemOrange
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    private var bananas: [UIImageView] = []
    private var score = 0
    private var bananaSpeed: CGFloat = 5.0
    private var fallingTimer: Timer?
    private var gameLoop: CADisplayLink?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startGame()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        self.navigationItem.hidesBackButton = true
        
        view.addSubview(monkeyImageView)
        view.addSubview(scoreLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            monkeyImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            monkeyImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            monkeyImageView.heightAnchor.constraint(equalToConstant: 160),
            monkeyImageView.widthAnchor.constraint(equalTo: monkeyImageView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            scoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    private func startGame() {
        fallingTimer = Timer.scheduledTimer(withTimeInterval: 0.8, repeats: true) { [weak self] _ in
            self?.fallingBanana()
        }
        
        gameLoop = CADisplayLink(target: self, selector: #selector(updateGame))
        gameLoop?.add(to: .main, forMode: .default)
    }
    
    private func fallingBanana() {
        let banana = UIImageView(image: bananaImage.image)
        let randomX = CGFloat.random(in: 0...(view.bounds.width - 40))
        banana.frame = CGRect(x: randomX, y: 0, width: 50, height: 50)
        bananas.append(banana)
        view.addSubview(banana)
    }
    
    @objc private func updateGame() {
        for (index, banana) in bananas.enumerated().reversed() {
            banana.frame.origin.y += bananaSpeed
            
            if banana.frame.origin.y > view.bounds.height {
                banana.removeFromSuperview()
                bananas.remove(at: index)
                
                fallingTimer?.invalidate()
                gameLoop?.invalidate()
                
                showGameOverAlert()
                
                return
            }
            
            if monkeyImageView.frame.intersects(banana.frame) {
                score += 1
                updateScore()
                
                banana.removeFromSuperview()
                bananas.remove(at: index)
            }
        }
    }
    
    @objc private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        
        let newX = monkeyImageView.center.x + translation.x
        let newY = monkeyImageView.center.y + translation.y
        let clampedX = min(max(newX, monkeyImageView.frame.width / 2), view.bounds.width - monkeyImageView.frame.width / 2)
        let clampedY = min(max(newY, monkeyImageView.frame.height / 2), view.bounds.height - monkeyImageView.frame.height / 2)
        
        monkeyImageView.center = CGPoint(x: clampedX, y: clampedY)
        
        gesture.setTranslation(.zero, in: view)
    }
    
    private func updateScore() {
        scoreLabel.text = "Score: \(score)"
        
        if score >= 20 {
            fallingTimer?.invalidate()
            gameLoop?.invalidate()
            showWinAlert()
            
            return
        }
        
        bananaSpeed += 0.5
    }
    
    private func showGameOverAlert() {
        let alert = UIAlertController(title: "Game Over", message: "You missed a banana! Your final score is \(score).", preferredStyle: .alert)
        let playAgainAction = UIAlertAction(title: "Play Again", style: .default) { [weak self] _ in
            self?.resetGame()
        }
        alert.addAction(playAgainAction)
        present(alert, animated: true)
    }
    
    private func showWinAlert() {
        let alert = UIAlertController(title: "Congratulations!", message: "You are the winner!", preferredStyle: .alert)
        let playAgainAction = UIAlertAction(title: "Play Again", style: .default) { [weak self] _ in
            self?.resetGame()
        }
        alert.addAction(playAgainAction)
        present(alert, animated: true)
    }
    
    private func resetGame() {
        score = 0
        bananaSpeed = 5.0
        scoreLabel.text = "Score: 0"
        bananas.forEach { $0.removeFromSuperview() }
        bananas.removeAll()
        startGame()
        
        navigationController?.popViewController(animated: false)
    }
}
