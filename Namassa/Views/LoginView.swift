//
//  LoginView.swift
//  Namassa
//
//  Created by found on 17/01/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isInvalidEmail = false
    @State private var isinvalidPass = false
    
    var body: some View {
        ZStack{
            VStack{
                Image(systemName: "Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    //.foregroundColor(.gray.opacity(0.3))
                    .padding(.bottom, 40)
                
                
                
                Text("Acesse sua conta")
                    .font(.system(size: 26))
                    .padding(.bottom, 30)
                
//                ZStack{
//                    Image(systemName: "rectangle.fill")
//                        
//                }
                
                VStack(spacing:20){//qd colocar sombra, poe 33 em spacing
                    
                    ZStack{
                        FieldView(symbol:"mail" ,message: "Insira seu email", txt: $email, isSecure: false)
                    }
                    .frame(height: 50)
                        
                    
                    ZStack{
                        FieldView(symbol: "key" ,message: "Insira sua senha", txt: $password, isSecure: true)
                    }
                    .frame(height: 50)
                    
                    
                    
                    Button {
                        print()
                        print(email)
                        print(password)
                        print()
                    }label: {
                        Text("ACESSAR")
                            .font(.system(size:20))
                            .foregroundColor(.black)
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                            .padding(.leading, 50)
                            .padding(.trailing, 50)
                    }
                    .background(Color(hex: "#FF2201"))
                    .clipShape(.rect(cornerRadius: 10))
                    .shadow(radius: 2)
                    
                }//fim VStack
                        
                Spacer()
                Button {
                    //RegisterView
                }label: {
                    Text("Não possui uma conta?")
                        .foregroundColor(.black.opacity(0.4))
                        .underline()
                }
            }
            .padding()
            
        }
    }
}


#Preview {
    LoginView()
}



extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue >> 16) & 0xFF) / 255.0
        let green = Double((rgbValue >> 8) & 0xFF) / 255.0
        let blue = Double(rgbValue & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
