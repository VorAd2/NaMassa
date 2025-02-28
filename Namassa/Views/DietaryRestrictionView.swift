//
//  DietaryRestrictionView.swift
//  Namassa
//
//  Created by found on 14/02/25.
//

import SwiftUI

struct DietaryRestrictionView: View {
    var body: some View {
        
        VStack {
            Text("Bem vindo(a)!")
                .font(.system(size: 38))
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(Color(hex:"790707"))
                .fontWeight(.medium)
                .padding(.bottom, 32)
            
            Text("Você possui restrição alimentar?")
                .fontWeight(.medium)
                .font(.system(size: 25))
                .padding(.bottom, 22)
            
            VStack(spacing:10){
                Button{
                    
                }label: {
                    RestrictionRectangle(text:"Não possuo")
                }
                Button{
                    
                }label: {
                    RestrictionRectangle(text:"Intolerância à lactose")
                }
                Button{
                    
                }label: {
                    RestrictionRectangle(text:"Intolerância à gluten")
                }
                Button{
                    
                }label: {
                    RestrictionRectangle(text:"Alergia a frutos do mar")
                }
                Button{
                    
                }label: {
                    RestrictionRectangle(text:"Sou vegano(a)")
                }
            }
                
            
            Spacer()
        }
    }
}

struct RestrictionRectangle: View {
    let text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 331, height: 46)
                .foregroundColor(Color(hex:"E3A09F"))
            Text(text)
                .foregroundColor(.black)
                .fontWeight(.regular)
                .font(.system(size:25))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 53)
                //.font(.custom("IBMPlexSansJP-Bold", size: 25))
        }
    }
}

#Preview {
    DietaryRestrictionView()
}
