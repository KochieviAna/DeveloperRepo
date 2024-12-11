//
//  TimersView.swift
//  Assignment30
//
//  Created by MacBook on 11.12.24.
//

import SwiftUI

struct TimersView: View {
    @StateObject private var viewModel = TimerViewModel()
    
    @State private var newTitle: String = ""
    @State private var newHours: String = ""
    @State private var newMinutes: String = ""
    @State private var newSeconds: String = ""
    
    func addNewTimer() {
        let hours = Int(newHours) ?? 0
        let minutes = Int(newMinutes) ?? 0
        let seconds = Int(newSeconds) ?? 0
        
        let totalDuration = (hours * 3600) + (minutes * 60) + seconds
        viewModel.addTimer(title: newTitle, duration: totalDuration)
        
        newTitle = ""
        newHours = ""
        newMinutes = ""
        newSeconds = ""
    }
    
    var body: some View {
        VStack {
            timerHeadline
            
            List {
                ForEach(viewModel.timers.indices, id: \.self) { index in
                    TimerRowView(
                        timer: $viewModel.timers[index],
                        onDelete: { viewModel.deleteTimer(index: index) },
                        onToggle: { viewModel.toggleTimer(index: index) },
                        onReset: { viewModel.resetTimer(index: index) }
                    )
                    .contentShape(Rectangle())
                    .background(.clear)
                }
            }
            .padding()
            .scrollContentBackground(.hidden)
            .background(.clear)
            
            LazyVStack {
                timerTitleTextFields
                
                LazyHStack {
                    hoursTextField
                    
                    minutesTextField
                    
                    secondsTextField
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                addTimerButton
            }
            .padding()
            .background(Color.primaryGrey)
        }
        .background(Color.primaryNoirGrey)
    }
    
    private var timerHeadline: some View {
        LazyVStack(alignment: .leading) {
            Text("ტაიმერები")
                .font(.interBold(size: 24))
                .foregroundStyle(.primaryWhite)
                .padding()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 110)
        .background(Color.primaryGrey)
    }
    
    private var timerTitleTextFields: some View {
        TextField("ტაიმერის სახელი", text: $newTitle)
            .frame(width: 350, height: 39)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.primaryLightGrey))
    }
    
    private var hoursTextField: some View {
        TextField("სთ", text: $newHours)
            .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .frame(width: 110, height: 39)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.primaryLightGrey))
    }
    
    private var minutesTextField: some View {
        TextField("მნ", text: $newMinutes)
            .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .frame(width: 110, height: 39)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.primaryLightGrey))
    }
    
    private var secondsTextField: some View {
        TextField("წმ", text: $newSeconds)
            .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .frame(width: 110, height: 39)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.primaryLightGrey))
    }
    
    private var addTimerButton: some View {
        Button("დამატება") {
            addNewTimer()
        }
        .padding()
        .frame(width: 155, height: 42)
        .background(.primaryBlue)
        .cornerRadius(8)
        .foregroundColor(.white)
    }
}

#Preview {
    TimersView()
}
