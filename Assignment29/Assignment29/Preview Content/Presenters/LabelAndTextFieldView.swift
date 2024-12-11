//
//  LabelAndTextFieldView.swift
//  Assignment29
//
//  Created by MacBook on 08.12.24.
//

import SwiftUI

struct LabelAndTextFieldView: View {
    @State var labelText: String
    @State var textFieldPlaceHolderText: String
    @Binding var textFieldText: String
    
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 4) {
            Text(labelText)
                .font(.interRegular(size: 9))
                .foregroundStyle(Color("primaryGray"))
            
            TextField(textFieldPlaceHolderText, text: $textFieldText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.robotoRegular(size: 12))
                .foregroundStyle(Color("primaryBlack"))
                .cornerRadius(4)
        }
        .frame(width: 281.25, height: 47.77)
        .background(Color.clear)
    }
}

#Preview {
    @Previewable @State var textFieldText: String = ""
    
    LabelAndTextFieldView(labelText: "Company", textFieldPlaceHolderText: "Enter Company Name", textFieldText: $textFieldText)
}
