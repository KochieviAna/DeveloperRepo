//
//  RiddleViewModel.swift
//  Assignment35
//
//  Created by MacBook on 27.12.24.
//

import Foundation
import SwiftUI

enum Category {
    case movies
    case books
    case anime
}

class RiddleViewModel: ObservableObject {
    @Published var currentRiddleIndex: Int = 0
    @Published var score: Int = 0
    @Published var timerValue: Int = 10
    @Published var isGameOver: Bool = false
    @Published var isAnswerCorrect: Bool = false
    @Published var selectedAnswer: String? = nil
    @Published var riddles: [RiddleModel] = []
    @Published var incorrectAnswersCount: Int = 0
    
    private var gameTimer: Timer?
    
    private let movieRiddles: [RiddleModel] = [
        RiddleModel(
            emojiSequence: "🏴‍☠️⚔️🌊🗺️☠️",
            answers: ["Pirates of the Caribbean", "Treasure Island", "Captain Phillips", "Robinson Crusoe"],
            correctAnswer: "Pirates of the Caribbean"
        ),
        RiddleModel(
            emojiSequence: "🕶️🌃🖤🔫💊",
            answers: ["The Matrix", "Blade Runner", "Inception", "The Dark Knight"],
            correctAnswer: "The Matrix"
        ),
        RiddleModel(
            emojiSequence: "👸❄️⛄🌨️🎵",
            answers: ["Tangled", "Frozen", "Moana", "Cinderella"],
            correctAnswer: "Frozen"
        ),
        RiddleModel(
            emojiSequence: "🦁👑",
            answers: ["The Lion King", "Tarzan", "Finding Nemo", "Bambi"],
            correctAnswer: "The Lion King"
        ),
        RiddleModel(
            emojiSequence: "👨‍🚀🌕",
            answers: ["Apollo 13", "Interstellar", "The Martian", "Gravity"],
            correctAnswer: "Interstellar"
        ),
        RiddleModel(
            emojiSequence: "👩‍🍳🍝",
            answers: ["Ratatouille", "Chef", "Julie & Julia", "The Hundred-Foot Journey"],
            correctAnswer: "Ratatouille"
        ),
        RiddleModel(
            emojiSequence: "🦇🧛",
            answers: ["Batman", "Twilight", "Dracula", "Buffy the Vampire Slayer"],
            correctAnswer: "Batman"
        ),
        RiddleModel(
            emojiSequence: "🐍🎩",
            answers: ["Harry Potter", "The Hobbit", "Lord of the Rings", "Fantastic Beasts"],
            correctAnswer: "Harry Potter"
        ),
        RiddleModel(
            emojiSequence: "🤠👢🐎",
            answers: ["Toy Story", "The Good, The Bad, and The Ugly", "Tombstone", "Django Unchained"],
            correctAnswer: "Toy Story"
        ),
        RiddleModel(
            emojiSequence: "🕵️‍♂️🔍",
            answers: ["Sherlock Holmes", "The Girl with the Dragon Tattoo", "Nancy Drew", "The Hardy Boys"],
            correctAnswer: "Sherlock Holmes"
        )
    ]
    
    private let bookRiddles: [RiddleModel] = [
        RiddleModel(
            emojiSequence: "⚡👦",
            answers: ["Harry Potter and the Sorcerer's Stone", "Percy Jackson and the Olympians", "The Hunger Games", "Eragon"],
            correctAnswer: "Harry Potter and the Sorcerer's Stone"
        ),
        RiddleModel(
            emojiSequence: "🌪👠",
            answers: ["The Wizard of Oz", "Alice's Adventures in Wonderland", "Peter Pan", "Wicked"],
            correctAnswer: "The Wizard of Oz"
        ),
        RiddleModel(
            emojiSequence: "🔪📖",
            answers: ["The Shining", "Pride and Prejudice", "Murder on the Orient Express", "The Catcher in the Rye"],
            correctAnswer: "Murder on the Orient Express"
        ),
        RiddleModel(
            emojiSequence: "🐍📖",
            answers: ["The Chronicles of Narnia", "The Hobbit", "A Game of Thrones", "Harry Potter"],
            correctAnswer: "The Chronicles of Narnia"
        ),
        RiddleModel(
            emojiSequence: "🐱🍫",
            answers: ["Charlie and the Chocolate Factory", "Alice's Adventures in Wonderland", "The Cat in the Hat", "Matilda"],
            correctAnswer: "Charlie and the Chocolate Factory"
        ),
        RiddleModel(
            emojiSequence: "🌲⛺",
            answers: ["Into the Wild", "The Call of the Wild", "The Lord of the Rings", "Wild"],
            correctAnswer: "Into the Wild"
        ),
        RiddleModel(
            emojiSequence: "👧⛓️",
            answers: ["The Hunger Games", "Divergent", "The Maze Runner", "The Giver"],
            correctAnswer: "The Hunger Games"
        ),
        RiddleModel(
            emojiSequence: "🦁👑",
            answers: ["The Lion King", "Mufasa", "The Chronicles of Narnia", "Alice in Wonderland"],
            correctAnswer: "The Chronicles of Narnia"
        ),
        RiddleModel(
            emojiSequence: "💔📝",
            answers: ["Romeo and Juliet", "Pride and Prejudice", "Wuthering Heights", "The Great Gatsby"],
            correctAnswer: "Romeo and Juliet"
        ),
        RiddleModel(
            emojiSequence: "🕵️‍♂️🔍",
            answers: ["Sherlock Holmes", "Agatha Christie", "Miss Marple", "Poirot"],
            correctAnswer: "Sherlock Holmes"
        )
    ]
    
    private let animeRiddles: [RiddleModel] = [
        RiddleModel(
            emojiSequence: "🍜👨‍🍳",
            answers: ["Naruto", "One Piece", "Attack on Titan", "Dragon Ball Z"],
            correctAnswer: "Naruto"
        ),
        RiddleModel(
            emojiSequence: "👹⚔️",
            answers: ["Demon Slayer", "Inuyasha", "Tokyo Ghoul", "Bleach"],
            correctAnswer: "Demon Slayer"
        ),
        RiddleModel(
            emojiSequence: "⚡👦",
            answers: ["My Hero Academia", "Attack on Titan", "Naruto", "Dragon Ball Z"],
            correctAnswer: "My Hero Academia"
        ),
        RiddleModel(
            emojiSequence: "🏃‍♂️🏞️",
            answers: ["One Punch Man", "Haikyuu!", "Death Note", "Naruto"],
            correctAnswer: "Haikyuu!"
        ),
        RiddleModel(
            emojiSequence: "⚔️👑",
            answers: ["Attack on Titan", "Sword Art Online", "Fullmetal Alchemist", "One Piece"],
            correctAnswer: "Attack on Titan"
        ),
        RiddleModel(
            emojiSequence: "🌑👦",
            answers: ["Naruto", "Death Note", "Dragon Ball Z", "Tokyo Ghoul"],
            correctAnswer: "Death Note"
        ),
        RiddleModel(
            emojiSequence: "🐉🌍",
            answers: ["Dragon Ball Z", "One Piece", "Bleach", "Fairy Tail"],
            correctAnswer: "Dragon Ball Z"
        ),
        RiddleModel(
            emojiSequence: "🧠👨‍⚕️",
            answers: ["Steins;Gate", "Neon Genesis Evangelion", "Attack on Titan", "One Piece"],
            correctAnswer: "Steins;Gate"
        ),
        RiddleModel(
            emojiSequence: "🍙👾",
            answers: ["Pokémon", "Dragon Ball Z", "Naruto", "One Piece"],
            correctAnswer: "Pokémon"
        ),
        RiddleModel(
            emojiSequence: "⚔️🛡️",
            answers: ["One Piece", "Bleach", "Naruto", "Attack on Titan"],
            correctAnswer: "One Piece"
        )
    ]
    
    init(category: Category) {
        switch category {
        case .movies:
            riddles = movieRiddles
        case .books:
            riddles = bookRiddles
        case .anime:
            riddles = animeRiddles
        }
        startTimer()
    }
    
    func startTimer() {
        if !isGameOver {
            gameTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
                self?.onTimerTick()
            }
        }
    }
    
    func stopTimer() {
        gameTimer?.invalidate()
        gameTimer = nil
    }
    
    func onTimerTick() {
        if timerValue > 0 && !isGameOver {
            DispatchQueue.main.async {
                self.timerValue -= 1
            }
        } else if timerValue == 0 && !isGameOver {
            DispatchQueue.main.async { [weak self] in
                self?.isGameOver = true
                self?.stopTimer()
            }
        }
    }
    
    func checkAnswer() {
        guard let selectedAnswer = selectedAnswer else { return }
        isAnswerCorrect = selectedAnswer == riddles[currentRiddleIndex].correctAnswer
        
        if isAnswerCorrect {
            score += 1
        } else {
            incorrectAnswersCount += 1
        }
        
        if incorrectAnswersCount > (riddles.count / 2) {
            isGameOver = true
            stopTimer()
        } else {
            nextRiddle()
        }
    }
    
    func nextRiddle() {
        if currentRiddleIndex < riddles.count - 1 {
            currentRiddleIndex += 1
            timerValue = 10
            isAnswerCorrect = false
            selectedAnswer = nil
        } else {
            isGameOver = true
            stopTimer()
        }
    }
    
    func resetGame() {
        score = 0
        currentRiddleIndex = 0
        timerValue = 10
        isGameOver = false
        incorrectAnswersCount = 0
        selectedAnswer = nil
        startTimer()
    }
}
