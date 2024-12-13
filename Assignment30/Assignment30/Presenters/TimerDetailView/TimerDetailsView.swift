//
//  TimerDetailsView.swift
//  Assignment30
//
//  Created by MacBook on 13.12.24.
//

import SwiftUI

struct TimerDetailsView: View {
    @Binding var timer: TimerModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.primaryNoirGrey
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack{
                    arrowBackButton
                    
                    Spacer()
                    
                    titleText
                    
                    Spacer(minLength: 30)
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .frame(height: 110)
                .background(Color.primaryDarkGrey)
                
                ScrollView {
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
                        
                        VStack(alignment: .leading) {
                            activityHistoryText
                                .padding([.top, .horizontal])
                                .padding(16)
                            
                            dividerColor
                                .padding(.horizontal)
                            
                            HStack {
                                dateText
                                
                                remainingTimeText
                                    .offset(x: 70)
                            }
                            .padding(.horizontal, 28)
                            .padding([.top, .bottom], 16)
                            
                            ForEach(timer.usageHistory, id: \.date) { history in
                                HStack {
                                    formattedDateText(for: history.date)
                                    formattedTimeText(for: history.remainingTime)
                                        .offset(x: 70)
                                }
                                .padding(.bottom)
                                .padding(.horizontal, 28)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.primaryDarkGrey)
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
            .font(.interBold(size: 24))
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
            .font(.interMedium(size: 18))
            .foregroundStyle(.primaryWhite)
    }
    
    private var timeText: some View {
        Text(formatTime(timer.timeRemaining))
            .font(.interBold(size: 36))
            .foregroundStyle(.primaryBlue)
    }
    
    private var activityHistoryText: some View {
        Text("აქტივობის ისტორია")
            .font(.interMedium(size: 18))
            .foregroundStyle(.primaryWhite)
    }
    
    private var dividerColor: some View {
        Color.primaryWhite
            .frame(maxWidth: .infinity, alignment: .center)
            .frame(height: 1)
    }
    
    private var dateText: some View {
        Text("თარიღი")
            .font(.interMedium(size: 14))
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.primaryWhite)
    }
    
    private var remainingTimeText: some View {
        Text("დრო")
            .font(.interMedium(size: 14))
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.primaryWhite)
    }
    
    private func formattedDateText(for date: Date) -> some View {
        Text(formattedGeorgianDate(from: date))
            .font(.interMedium(size: 14))
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.primaryWhite)
    }
    
    private func formattedTimeText(for time: Int) -> some View {
        Text(formatTime(time))
            .font(.interMedium(size: 14))
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.primaryWhite)
    }
    
}

#Preview {
    TimerDetailsView(timer: .constant(TimerModel(title: "საცდელი ტაიმერი", duration: 3600)))
}
