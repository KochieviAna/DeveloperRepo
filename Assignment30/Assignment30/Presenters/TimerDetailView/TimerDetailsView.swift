//
//  TimerDetailsView.swift
//  Assignment30
//
//  Created by MacBook on 13.12.24.
//

import SwiftUI

struct TimerDetailsView: View {
    @Binding var timer: TimerModel
    
    var body: some View {
        ZStack {
            Color.primaryNoirGrey
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                titleText
                    .padding(.top, 0)
                    .padding(.bottom, 0)
                
                ScrollView {
                    VStack {
                        VStack {
                            Image(systemName: "timer")
                                .foregroundColor(.primaryOrange)
                            Text(formatTime(timer.timeRemaining))
                                .font(.interBold(size: 36))
                                .foregroundStyle(.primaryBlue)
                        }
                        .padding()
                        
                        VStack(alignment: .leading) {
                            Text("აქტივობის ისტორია")
                                .font(.interMedium(size: 18))
                                .padding([.top, .horizontal])
                                .foregroundStyle(.primaryWhite)
                            
                            HStack {
                                Text("თარიღი")
                                    .font(.interMedium(size: 14))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundStyle(.primaryWhite)
                                Text("დრო")
                                    .font(.interMedium(size: 14))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .foregroundStyle(.primaryWhite)
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 5)
                            
                            ForEach(timer.usageHistory, id: \.date) { history in
                                HStack {
                                    Text(formattedGeorgianDate(from: history.date))
                                        .font(.interMedium(size: 14))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Text(formatTime(history.remainingTime))
                                        .font(.interMedium(size: 14))
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .padding(.horizontal)
                                Divider()
                            }
                        }
                    }
                    .padding(.top, 0)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private var titleText: some View {
        LazyVStack {
            Text(timer.title)
                .font(.interBold(size: 24))
                .foregroundStyle(.primaryWhite)
                .padding(.top, 0)
                .padding(.bottom, 0)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 110)
        .background(Color.primaryDarkGrey)
    }
    
    private func formatTime(_ time: Int) -> String {
        let hours = time / 3600
        let minutes = (time % 3600) / 60
        let seconds = time % 60
        
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

#Preview {
    TimerDetailsView(timer: .constant(TimerModel(title: "Sample Timer", duration: 3600)))
}
