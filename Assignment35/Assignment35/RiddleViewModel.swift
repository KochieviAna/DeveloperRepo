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
    
    private let movieRiddles: [RiddleModel] = [
        RiddleModel(emojiSequence: "🏴‍☠️⚔️🌊🗺️☠️", answers: ["Pirates of the Caribbean", "Treasure Island", "Captain Phillips", "Robinson Crusoe"], correctAnswer: "Pirates of the Caribbean"),
        RiddleModel(emojiSequence: "🕶️🌃🖤🔫💊", answers: ["The Matrix", "Blade Runner", "Inception", "The Dark Knight"], correctAnswer: "The Matrix"),
        RiddleModel(emojiSequence: "👸❄️⛄🌨️🎵", answers: ["Tangled", "Frozen", "Moana", "Cinderella"], correctAnswer: "Frozen")
    ]
    
    private let bookRiddles: [RiddleModel] = [
        RiddleModel(emojiSequence: "⚡👦", answers: ["Harry Potter and the Sorcerer's Stone", "Percy Jackson and the Olympians", "The Hunger Games", "Eragon"], correctAnswer: "Harry Potter and the Sorcerer's Stone"),
        RiddleModel(emojiSequence: "🌪👠", answers: ["The Wizard of Oz", "Alice's Adventures in Wonderland", "Peter Pan", "Wicked"], correctAnswer: "The Wizard of Oz"),
        RiddleModel(emojiSequence: "🔪📖", answers: ["The Shining", "Pride and Prejudice", "Murder on the Orient Express", "The Catcher in the Rye"], correctAnswer: "Murder on the Orient Express")
    ]
    
    private let animeRiddles: [RiddleModel] = [
        RiddleModel(emojiSequence: "🍜👨‍🍳", answers: ["Naruto", "One Piece", "Attack on Titan", "Dragon Ball Z"], correctAnswer: "Naruto"),
        RiddleModel(emojiSequence: "👹⚔️", answers: ["Demon Slayer", "Inuyasha", "Tokyo Ghoul", "Bleach"], correctAnswer: "Demon Slayer"),
        RiddleModel(emojiSequence: "⚡👦", answers: ["My Hero Academia", "Attack on Titan", "Naruto", "Dragon Ball Z"], correctAnswer: "My Hero Academia")
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
    }
    
    func onTimerTick() {
        if timerValue > 0 && !isGameOver {
            timerValue -= 1
        } else if timerValue == 0 && !isGameOver {
            nextRiddle()
        }
    }
    
    func checkAnswer() {
        guard let selectedAnswer = selectedAnswer else { return }
        isAnswerCorrect = selectedAnswer == riddles[currentRiddleIndex].correctAnswer
        
        if isAnswerCorrect {
            score += 1
        }
        
        nextRiddle()
    }
    
    func nextRiddle() {
        if currentRiddleIndex < riddles.count - 1 {
            currentRiddleIndex += 1
            timerValue = 10
            isAnswerCorrect = false
            selectedAnswer = nil
        } else {
            isGameOver = true
        }
    }
    
    func resetGame() {
        score = 0
        currentRiddleIndex = 0
        timerValue = 10
        isGameOver = false
        selectedAnswer = nil
    }
}
