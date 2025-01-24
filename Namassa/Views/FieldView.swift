//
//  FieldView.swift
//  Namassa
//
//  Created by found on 21/01/25.
//

import SwiftUI

struct FieldView: View {
    var symbol: String
    var message: String
    @Binding var txt: String
    var isSecure: Bool
    //var isInvalidContent: Bool
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.black.opacity(0.5))
                .offset(x: 0, y: -1)
            
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.black.opacity(0.5))
                .offset(x: 0, y: 1)
            
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.black.opacity(0.1))
                .offset(x: 0, y: 4)
            
            
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.black.opacity(0.5))
                .offset(x: 1, y: 0)
            
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.black.opacity(0.5))
                .offset(x: -1, y: 0)
            
//            if isInvalidContent {
//                RoundedRectangle(cornerRadius: 12)
//                    .fill(Color.red.opacity(2))
//                    .offset(x: 0, y: -2)
//                
//                RoundedRectangle(cornerRadius: 12)
//                    .fill(Color.red.opacity(2))
//                    .offset(x: 0, y: 2)
//                
//                RoundedRectangle(cornerRadius: 12)
//                    .fill(Color.red.opacity(0.5))
//                    .offset(x: 1, y: 0)
//                
//                RoundedRectangle(cornerRadius: 12)
//                    .fill(Color.red.opacity(0.5))
//                    .offset(x: -1, y: 0)
//            }
            
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
            
            HStack{
                Image(systemName: symbol)
                    .padding(.leading)
                if isSecure{
                    SecureField("\(message)", text: $txt)
                        .padding()
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .cornerRadius(12)
                } else {
                    TextField("\(message)", text: $txt)
                        .padding()
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .cornerRadius(12)
                }
            }
        }
        .frame(height: 50)
    }
    
}

#Preview {
    //FieldView(message: "Message", txt: ")
}
