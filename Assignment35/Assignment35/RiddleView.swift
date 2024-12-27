//
//  RiddleView.swift
//  Assignment35
//
//  Created by MacBook on 27.12.24.
//

import SwiftUI

struct RiddleView: View {
    
    @ObservedObject var viewModel: RiddleViewModel
    
    private var currentRiddle: RiddleModel {
        viewModel.riddles[viewModel.currentRiddleIndex]
    }
    
    var body: some View {
        VStack {
            emojiSequence
            answerButtons
            scoreAndTimer
            gameOverMessage
        }
        .onAppear {
            viewModel.resetGame()
        }
        .padding()
    }
    
    private var emojiSequence: some View {
        Text(currentRiddle.emojiSequence)
            .font(.largeTitle)
            .padding()
    }
    
    private var answerButtons: some View {
        VStack {
            ForEach(currentRiddle.answers, id: \.self) { answer in
                Button(action: { handleAnswerSelection(answer) }) {
                    Text(answer)
                        .padding()
                        .background(buttonBackground(for: answer))
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
                .padding(5)
            }
        }
    }
    
    private func handleAnswerSelection(_ answer: String) {
        viewModel.selectedAnswer = answer
        viewModel.checkAnswer()
    }
    
    private func buttonBackground(for answer: String) -> Color {
        viewModel.selectedAnswer == answer ? .green : .gray
    }
    
    private var scoreAndTimer: some View {
        VStack {
            Text("Time Left: \(viewModel.timerValue)")
            Text("Score: \(viewModel.score)")
        }
        .padding(.top)
    }
    
    private var gameOverMessage: some View {
        Group {
            if viewModel.isGameOver {
                Text("Game Over!")
                    .font(.title)
                    .padding(.top)
            }
        }
    }
}

#Preview {
    RiddleView(viewModel: RiddleViewModel(category: .movies))
}
