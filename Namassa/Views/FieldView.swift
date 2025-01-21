//
//  FieldView.swift
//  Namassa
//
//  Created by found on 21/01/25.
//

import SwiftUI

struct FieldView: View {
    var message: String
    @Binding var txt: String // Nao esta modificando
    
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
                
            
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
            
            TextField("\(message)", text: $txt)
                .padding()
                .autocorrectionDisabled()
                .autocapitalization(.none)
        }
        .frame(height: 50)
    }
    
}

#Preview {
    //FieldView(message: "Message", txt: ")
}
