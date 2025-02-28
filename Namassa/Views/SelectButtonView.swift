//
//  SelectButtonView.swift
//  Namassa
//
//  Created by found on 18/02/25.
//

import SwiftUI

struct SelectButtonView: View {
    var buttonSelected: Bool
//    @Binding var buttonSelected: Bool
    @State var textColor: Color
    @State var color: Color
    @State var text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 113, height: 61)
                .foregroundColor(buttonSelected ? color : Color(hex:"CDCDCD"))
            Text(text)
                .fontWeight(.medium)
                .font(.system(size: 24))
                .foregroundColor(buttonSelected ? textColor : .black)
        }
    }
}

#Preview {
    SelectButtonView(buttonSelected: false, textColor: .white, color: .red, text: "pec")
}
