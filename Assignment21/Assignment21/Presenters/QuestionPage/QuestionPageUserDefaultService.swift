//
//  QuestionPageUserDefaultService.swift
//  Assignment21
//
//  Created by MacBook on 07.11.24.
//

import Foundation

final class QuestionPageUserDefaultService {
    private let correctAnswersKey = "correctAnswersCount"
    private let incorrectAnswersKey = "incorrectAnswersCount"
    
    func updateAnswerCount(isCorrect: Bool) {
        let key = isCorrect ? correctAnswersKey : incorrectAnswersKey
        let currentCount = UserDefaults.standard.integer(forKey: key)
        UserDefaults.standard.set(currentCount + 1, forKey: key)
    }
    
    func getCorrectAnswersCount() -> Int {
        return UserDefaults.standard.integer(forKey: correctAnswersKey)
    }
    
    func getIncorrectAnswersCount() -> Int {
        return UserDefaults.standard.integer(forKey: incorrectAnswersKey)
    }
}
