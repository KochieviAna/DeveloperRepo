//
//  QuizPageViewModel.swift
//  Assignment21
//
//  Created by MacBook on 03.11.24.
//

import Foundation

final class QuizPageViewModel {
    
    var questions: [Question] = []
    
    var onDataUpdated: (() -> Void)?
    
    var allQuestions: [Question] {
        questions
    }
    
    var numberOfQuestions: Int {
        questions.count
    }
    
    func questions(at index: Int) -> Question {
        questions[index]
    }
    
    func saveDataFromPath() {
        let filePath = "/Users/macbook/Downloads/Questions 1.json"
        QuizPageFileManagerService.shared.saveJSONToDocumentsDirectory(fromPath: filePath)
    }
    
    func loadQuizData() {
        if let quizResponse = QuizPageFileManagerService.shared.loadAndDecodeQuizData() {
            self.questions = quizResponse.results
            print("Quiz Data loaded into questions array: \(self.questions)")
        } else {
            print("Failed to load and decode quiz data.")
        }
    }
}
