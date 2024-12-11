//
//  PortfolioView.swift
//  Assignment29
//
//  Created by MacBook on 07.12.24.
//

import SwiftUI

struct PortfolioView: View {
    
    @State private var companyInput: String = ""
    @State private var roleInput: String = ""
    @State private var durationInput: String = ""
    
    @State var jobExperience: [JobModel] = []
    
    @State private var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 23) {
                ZStack {
                    Rectangle()
                        .frame(width: .infinity, height: 84)
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
                
                if !jobExperience.isEmpty {
                    Text("Work Experience")
                        .font(.interSemiBold(size: 20))
                        .foregroundStyle(Color("primaryBlack"))
                        .offset(x: -80)
                    
                    LazyVStack(alignment: .leading, spacing: 5) {
                        ForEach(jobExperience, id: \.company) { jobExperience in
                            Spacer()
                            
                            Text(jobExperience.company)
                                .font(.interSemiBold(size: 17))
                                .foregroundStyle(Color("primaryBlack"))
                                .offset(x: 14)
                            
                            Text(jobExperience.role)
                                .font(.interLight(size: 15))
                                .foregroundStyle(Color("primaryGray"))
                                .offset(x: 14)
                            
                            Text(jobExperience.duration)
                                .font(.interLight(size: 15))
                                .foregroundStyle(Color("primaryGray"))
                                .offset(x: 14)
                            
                            Spacer()
                        }
                    }
                    .frame(width: 351)
                    .background(Color("secondaryGray").opacity(0.53))
                    .cornerRadius(24)
                }
                
                LazyVStack(spacing: 14) {
                    Text("Add New Work Experience")
                        .font(.interSemiBold(size: 17))
                        .foregroundStyle(Color("primaryBlack"))
                        .offset(x: -50)
                    
                    LabelAndTextFieldView(labelText: "C o m p a n y", textFieldPlaceHolderText: "Enter Company Name", textFieldText: $companyInput)
                    
                    LabelAndTextFieldView(labelText: "R o l e", textFieldPlaceHolderText: "Enter Role", textFieldText: $roleInput)
                    
                    LabelAndTextFieldView(labelText: "D u r a t i o n", textFieldPlaceHolderText: "Enter Duration", textFieldText: $durationInput)
                    
                    Button("Add Experience") {
                        if companyInput.isEmpty || roleInput.isEmpty || durationInput.isEmpty {
                            showAlert = true
                        } else {
                            let newJob = JobModel(
                                company: companyInput,
                                role: roleInput,
                                duration: durationInput
                            )
                            jobExperience.append(newJob)
                            companyInput = ""
                            roleInput = ""
                            durationInput = ""
                        }
                    }
                    .frame(width: 302, height: 40)
                    .foregroundStyle(Color("primaryWhite"))
                    .background(Color("primaryGreen"))
                    .cornerRadius(8)
                    .alert("Incomplete Input", isPresented: $showAlert) {
                        Button("OK", role: .cancel) {}
                    } message: {
                        Text("Please fill in all the fields before adding a new experience.")
                    }
                }
                .padding()
                .background(Color("secondaryGray").opacity(0.53))
                .cornerRadius(24)
                .frame(width: 351, height: 298)
            }
            .offset(y: 100)
            .padding(.bottom, 100)
        }
        .padding(.top)
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}


#Preview {
    PortfolioView()
}
