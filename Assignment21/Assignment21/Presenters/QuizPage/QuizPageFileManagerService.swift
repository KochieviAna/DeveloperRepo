//
//  QuizPageFileManagerService.swift
//  Assignment21
//
//  Created by MacBook on 06.11.24.
//

import Foundation

final class QuizPageFileManagerService {
    
    static let shared = QuizPageFileManagerService()
    
    func saveJSONToDocumentsDirectory(fromPath sourcePath: String) {
        let sourceURL = URL(fileURLWithPath: sourcePath)
        
        do {
            let jsonData = try Data(contentsOf: sourceURL)
            
            let fileManager = FileManager.default
            guard let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
                print("Could not locate the Documents directory.")
                return
            }
            
            let destinationURL = documentsURL.appendingPathComponent("Questions_1.json")
            
            try jsonData.write(to: destinationURL)
            print("File successfully saved to: \(destinationURL.path)")
            
        } catch {
            print("Error: \(error)")
        }
    }
    
    func loadAndDecodeQuizData() -> QuizResponse? {
        let fileManager = FileManager.default
        guard let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Could not locate the Documents directory.")
            return nil
        }
        
        let fileURL = documentsURL.appendingPathComponent("Questions_1.json")
        
        do {
            let data = try Data(contentsOf: fileURL)
            
            let decoder = JSONDecoder()
            let quizResponse = try decoder.decode(QuizResponse.self, from: data)
            print("Successfully decoded QuizResponse from file.")
            
            return quizResponse
        } catch {
            print("Error decoding JSON from file: \(error)")
            return nil
        }
    }
}
