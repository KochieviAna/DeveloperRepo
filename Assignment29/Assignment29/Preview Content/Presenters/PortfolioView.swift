//
//  PortfolioView.swift
//  Assignment29
//
//  Created by MacBook on 07.12.24.
//

import SwiftUI

struct PortfolioView: View {
    
    var jobExperience: [JobModel] = []
    
    var body: some View {
        ScrollView{
            LazyVStack{
                ZStack {
                    Rectangle()
                        .frame(width: 401, height: 84)
                        .foregroundStyle(Color("primaryWhite"))
                        .shadow(color: Color("primaryBlack").opacity(0.25), radius: 4, x: 0, y: 8)
                    
                    ZStack {
                        Circle()
                            .frame(width: 120)
                            .foregroundStyle(Color("primaryWhite"))
                            .shadow(color: Color("primaryBlack").opacity(0.25), radius: 4, x: 0, y: 4)
                        
                        Image("cat")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 102)
                    }
                    .offset(y: -62)
                    
                    Text("John Doe")
                        .font(.interSemiBold(size: 24))
                        .foregroundStyle(Color("primaryBlack"))
                        .offset(y: 27)
                }
                
                Text("iOS Developer | SwiftUI enthusiast | Tech Lover")
                    .font(.interSemiBold(size: 15))
                    .foregroundStyle(Color("primaryGray"))
                
                Text("Work Experience")
                    .font(.interSemiBold(size: 20))
                    .foregroundStyle(Color("primaryBlack"))
                    .offset(y: 23)
                    .offset(x: -84)
                
                LazyVStack {
                    ForEach(jobExperience, id: \.company) { jobExperience in
                        LazyVStack {
                            Text(jobExperience.company)
                                .font(.interSemiBold(size: 17))
                                .foregroundStyle(Color("primaryBlack"))
                            
                            Text(jobExperience.role)
                                .font(.interLight(size: 15))
                                .foregroundStyle(Color("primaryBlack"))
                            
                            Text(jobExperience.duration)
                                .font(.interLight(size: 15))
                                .foregroundStyle(Color("primaryBlack"))
                        }
                    }
                }
                .background(Color("secondaryGray")).opacity(0.53)
            }
            .offset(y: 98)
        }
    }
}

#Preview {
    PortfolioView()
}
