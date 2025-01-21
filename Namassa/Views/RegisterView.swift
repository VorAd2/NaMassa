//
//  RegisterView.swift
//  Namassa
//
//  Created by found on 21/01/25.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        ZStack{
            VStack{
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.gray.opacity(0.3))
                    .padding(.bottom, 40)
                
                
                
                Text("Crie sua conta")
                    .font(.system(size: 26))
                    .padding(.bottom, 30)
                
                VStack(spacing:20){//qd colocar sombra, poe 33 em spacing
                    
                    FieldView(message: "Insira seu nome de usuário", txt: $username)
                    
                    FieldView(message: "Insira seu E-mail", txt: $email)
                    
                    FieldView(message: "Insira sua senha", txt: $password)
                    
                    
                    Button {
                        print()
                        print(username)
                        print(email)
                        print(password)
                        print()
                    }label: {
                        Text("CRIAR")
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
            }
            .padding()
            
        }
    }
}

#Preview {
    RegisterView()
}



