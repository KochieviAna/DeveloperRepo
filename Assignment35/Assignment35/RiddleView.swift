//
//  RiddleView.swift
//  Assignment35
//
//  Created by MacBook on 27.12.24.
//

import SwiftUI

struct RiddleView: View {
    @ObservedObject var viewModel: RiddleViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.riddles[viewModel.currentRiddleIndex].emojiSequence)
                .font(.largeTitle)
                .padding()
            
            VStack {
                ForEach(viewModel.riddles[viewModel.currentRiddleIndex].answers, id: \.self) { answer in
                    Button(action: {
                        viewModel.selectedAnswer = answer
                        viewModel.checkAnswer()
                    }) {
                        Text(answer)
                            .padding()
                            .background(viewModel.selectedAnswer == answer ? Color.green : Color.gray)
                            .cornerRadius(8)
                            .foregroundColor(.white)
                    }
                    .padding(5)
                }
            }
            
            Spacer()
            Text("Time Left: \(viewModel.timerValue)")
            Text("Score: \(viewModel.score)")
            
            if viewModel.isGameOver {
                Text("Game Over!")
                    .font(.title)
            }
        }
        .onAppear {
            viewModel.resetGame()
        }
    }
}

#Preview {
    RiddleView(viewModel: RiddleViewModel(category: .movies))
}
