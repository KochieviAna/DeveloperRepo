//
//  TimerDetailsView.swift
//  Assignment30
//
//  Created by MacBook on 13.12.24.
//

import SwiftUI

struct TimerDetailsView: View {
    @ObservedObject var viewModel: TimerViewModel
    @Binding var timer: TimerModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            ZStack {
                Color.primaryNoirGrey
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        arrowBackButton
                        
                        Spacer()
                        
                        titleText
                        
                        Spacer(minLength: 30)
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .frame(height: 110)
                    .background(Color.primaryDarkGrey)
                    
                    
                    VStack {
                        VStack {
                            timerImage
                                .padding()
                            
                            durationText
                                .padding()
                            
                            timeText
                                .padding()
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 328)
                        .background(Color.primaryDarkGrey)
                        .cornerRadius(16)
                        .padding(.top, 16)
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            sessionsTodayText
                            
                            dividerColor
                            
                            averageSessionDurationText
                            
                            dividerColor
                            
                            totalTimeText
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.primaryDarkGrey)
                        .cornerRadius(16)
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading) {
                            activityHistoryText
                                .padding()
                            ForEach(groupedHistory(), id: \.key) { date, sessions in
                                VStack(alignment: .leading) {
                                    Text(formattedGeorgianDate(from: sessions.first?.stopDate ?? Date()))
                                        .font(.robotoRegular(size: 14))
                                        .foregroundStyle(.primaryDustyGrey)
                                        .padding(.top)
                                    
                                    ForEach(sessions) { history in
                                        HStack {
                                            Text(formattedGeorgianDate(from: history.stopDate))
                                                .font(.robotoRegular(size: 14))
                                                .foregroundStyle(.primaryWhite)
                                            
                                            Spacer()
                                            
                                            Text(formatTime(history.elapsedTime))
                                                .font(.robotoRegular(size: 14))
                                                .foregroundStyle(.primaryWhite)
                                        }
                                        .padding(.horizontal)
                                        .padding(.vertical, 4)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .cornerRadius(16)
                        .padding(.horizontal)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private var arrowBackButton: some View {
        Button(action: {
            dismiss()
        }) {
            Image("arrowBackButton")
                .resizable()
                .scaledToFit()
                .foregroundColor(.primaryWhite)
        }
        .frame(width: 24, height: 24)
    }
    
    private var titleText: some View {
        Text(timer.title)
            .font(.robotoBold(size: 24))
            .foregroundStyle(.primaryWhite)
            .frame(maxWidth: .infinity, alignment: .center)
            .multilineTextAlignment(.center)
    }
    
    private var timerImage: some View {
        Image("timerImage")
            .resizable()
            .scaledToFit()
            .frame(width: 70, height: 70)
    }
    
    private var durationText: some View {
        Text("ხანგრძლივობა")
            .font(.robotoRegular(size: 20))
            .foregroundStyle(.primaryWhite)
    }
    
    private var timeText: some View {
        Text(formatTimeVerbally(timer.timeRemaining))
            .font(.robotoBold(size: 36))
            .foregroundStyle(.primaryBlue)
    }
    
    private var activityHistoryText: some View {
        Text("აქტივობის ისტორია")
            .font(.robotoRegular(size: 18))
            .foregroundStyle(.primaryWhite)
    }
    
    private var sessionsTodayText: some View {
        HStack {
            Text("დღევანდელი სესიები")
                .font(.robotoBold(size: 15))
                .foregroundStyle(.primaryDustyGrey)
                .padding(.top)
                .padding(.horizontal)
            
            Spacer()
            
            Text(sessionsToday())
                .font(.robotoRegular(size: 15))
                .foregroundStyle(.primaryWhite)
                .padding(.top)
                .padding(.horizontal)
        }
    }
    
    private var averageSessionDurationText: some View {
        HStack {
            Text("საშუალო დრო")
                .font(.robotoBold(size: 15))
                .foregroundStyle(.primaryDustyGrey)
                .padding(.horizontal)
            
            Spacer()
            
            Text(averageSessionDuration())
                .font(.robotoRegular(size: 15))
                .foregroundStyle(.primaryWhite)
                .padding(.horizontal)
        }
    }
    
    private var totalTimeText: some View {
        HStack {
            Text("სულ დრო")
                .font(.robotoBold(size: 15))
                .foregroundStyle(.primaryDustyGrey)
                .padding(.horizontal)
                .padding(.bottom)
            
            Spacer()
            
            Text(totalTime())
                .font(.robotoRegular(size: 15))
                .foregroundStyle(.primaryWhite)
                .padding(.horizontal)
                .padding(.bottom)
        }
    }
    
    private var dividerColor: some View {
        Color.primaryLightGrey
            .frame(maxWidth: .infinity, alignment: .center)
            .frame(height: 0.5)
    }
    
    private func sessionsToday() -> String {
        let calendar = Calendar.current
        let sessionCount = timer.usageHistory.filter {
            calendar.isDateInToday($0.stopDate)
        }.count
        
        return "\(sessionCount) სესია"
    }
    
    private func averageSessionDuration() -> String {
        guard !timer.usageHistory.isEmpty else { return "0 წმ" }
        let totalDuration = timer.usageHistory.map { $0.elapsedTime }.reduce(0, +)
        
        return formatTimeVerbally(totalDuration / timer.usageHistory.count)
    }
    
    private func totalTime() -> String {
        let totalDuration = timer.usageHistory.map { $0.elapsedTime }.reduce(0, +)
        
        return formatTimeVerbally(totalDuration)
    }
    
    private func groupedHistory() -> [(key: String, value: [TimerHistory])] {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        let grouped = Dictionary(grouping: timer.usageHistory) { history in
            formatter.string(from: history.stopDate)
        }
        
        return grouped.sorted { $0.key > $1.key }
    }
}

#Preview {
    TimerDetailsView(viewModel: TimerViewModel(), timer: .constant(TimerModel(title: "Sample Timer", duration: 3600)))
}
