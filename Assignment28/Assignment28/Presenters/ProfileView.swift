//
//  ContentView.swift
//  Assignment28
//
//  Created by MacBook on 06.12.24.
//

import SwiftUI

struct ProfileView: View {
    var skills = [
        SkillsView(skill: "SwiftUI"),
        SkillsView(skill: "iOS Development"),
        SkillsView(skill: "Problem Solving"),
        SkillsView(skill: "UI/UX Design")
    ]
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 120)
                    .foregroundStyle(Color("primaryWhite"))
                    .shadow(color: Color("primaryBlack").opacity(0.5), radius: 1)
                
                Image("cat")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 102)
                    .shadow(color: Color("primaryBlack").opacity(0.5), radius: 1)
                
                Capsule()
                    .frame(width: 48.95, height: 20)
                    .foregroundStyle(Color("darkGreen"))
                    .padding(.top, 100.5)
                    .padding(.leading, 71.05)
                
                Text("Online")
                    .font(.robotoBold(size: 10))
                    .foregroundColor(Color("primaryWhite"))
                    .padding(.top, 100.5)
                    .padding(.leading, 71.05)
            }
            .padding(.top,20)
            .padding(.leading, 90)
            .padding(.trailing, 90)
            
            Text("Ana Kochievi")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color("primaryWhite"))
                .padding(.top, 20)
            
            Text("iOS Developer")
                .font(.robotoRegular(size: 14))
                .foregroundColor(Color("primaryWhite"))
                .padding(.top, 5)
            
            HStack {
                ContactView(contactInfo: "phone")
                    .padding(.trailing, 30)
                ContactView(contactInfo: "mail")
                    .padding(.trailing, 30)
                ContactView(contactInfo: "social")
            }
            .padding(.top, 21)
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(stops: [
                    Gradient.Stop(color: Color("electricBlue").opacity(0.65), location: 0.0),
                    Gradient.Stop(color: Color("primaryPurple").opacity(0.65), location: 1.0)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    ProfileView()
}
