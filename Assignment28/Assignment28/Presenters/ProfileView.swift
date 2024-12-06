//
//  ContentView.swift
//  Assignment28
//
//  Created by MacBook on 06.12.24.
//

import SwiftUI

struct ProfileView: View {
    @State private var isOnline: Bool = true
    
    var skills = [
        SkillsModel(skill: "SwiftUI"),
        SkillsModel(skill: "iOS Development"),
        SkillsModel(skill: "Problem Solving"),
        SkillsModel(skill: "UI/UX Design")
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
                    .foregroundStyle(isOnline ? Color("darkGreen") : Color("primaryRed"))
                    .padding(.top, 100.5)
                    .padding(.leading, 71.05)
                
                Text(isOnline ? "Online" : "Offline")
                    .font(.robotoBold(size: 10))
                    .foregroundColor(Color("primaryWhite"))
                    .padding(.top, 100.5)
                    .padding(.leading, 71.05)
            }
            .padding(.top, 20)
            
            Text("Ana Kochievi")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color("primaryWhite"))
            
            Text("iOS Developer")
                .font(.robotoRegular(size: 14))
                .foregroundColor(Color("primaryWhite"))
            
            HStack {
                ContactView(contactInfo: "phone")
                    .padding(.trailing, 20)
                ContactView(contactInfo: "mail")
                    .padding(.trailing, 20)
                ContactView(contactInfo: "social")
            }
            
            Text("Skills")
                .font(.robotoBold(size: 16))
                .foregroundColor(Color("primaryWhite"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
            
            ForEach(skills, id: \.skill) { skills in
                HStack {
                    Circle()
                        .frame(width: 5)
                        .foregroundStyle(Color("primaryWhite")).opacity(0.8)
                    
                    Text(skills.skill)
                        .font(.robotoRegular(size: 14.75))
                        .foregroundColor(Color("primaryWhite")).opacity(0.8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.top, 5)
            }
            
            ZStack {
                Capsule()
                    .frame(width: 164, height: 44)
                    .foregroundStyle(Color("primaryWhite")).opacity(0.2)
                Toggle("", isOn: $isOnline)
                    .padding(.trailing, 50)
                
                Text("Set Offline")
                    .font(.robotoRegular(size: 16))
                    .foregroundStyle(Color("primaryWhite"))
                    .padding(.trailing, 50)
                
                
            }
            .padding(.horizontal, 10)
        }
        .padding()
        .frame(width: 300, height: 491)
        .background(GradientView())        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    ProfileView()
}
