//
//  QuestionPageViewModel.swift
//  Assignment21
//
//  Created by MacBook on 07.11.24.
//

import Foundation

final class QuestionPageViewModel {
    private let correctAnswer: String
    let userDefaultsService: QuestionPageUserDefaultService
    
    init(correctAnswer: String, userDefaultsService: QuestionPageUserDefaultService) {
        self.correctAnswer = correctAnswer
        self.userDefaultsService = userDefaultsService
    }
    
    func checkAnswer(_ answer: String) -> Bool {
        let isCorrect = answer == correctAnswer
        userDefaultsService.updateAnswerCount(isCorrect: isCorrect)
        return isCorrect
    }
}
