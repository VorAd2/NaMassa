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
                .offset(x: 0, y: 3)
            
            
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.black.opacity(0.5))
                .offset(x: 1, y: 0)
            
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.black.opacity(0.5))
                .offset(x: -1, y: 0)
            

            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
            
            HStack{
                TextField("\(message)", text: $txt)
                    .padding()
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    .cornerRadius(12)
                Image(systemName: symbol)
                    .padding(.leading)
                    .padding(.trailing)
                }
        }
        .frame(height: 50)
        
        
    }
}

#Preview {
    //FieldView(message: "Message", txt: ")
}
