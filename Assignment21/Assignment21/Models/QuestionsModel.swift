//
//  QuestionsModel.swift
//  Assignment21
//
//  Created by MacBook on 06.11.24.
//

import Foundation

struct QuizResponse: Codable {
    var responseCode: Int
    var results: [Question]
    
    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results
    }
}

struct Question: Codable {
    var questionNumber: String
    var difficulty: String
    var category: String
    var question: String
    var correctAnswer: String
    var incorrectAnswers: [String]
    
    enum CodingKeys: String, CodingKey {
        case questionNumber
        case difficulty
        case category
        case question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}
