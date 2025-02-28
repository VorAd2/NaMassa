//
//  RecipeView.swift
//  Namassa
//
//  Created by found on 30/01/25.
//

import SwiftUI

struct RecipeView: View {
    @Environment(\.presentationMode) var presentationMode
    var recipe: RecipeModel
    
    var body: some View {
            ScrollView {
                VStack(spacing: 0) {
                    ZStack{
                        Image(recipe.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 300)
                            .clipped()
                            .background(Color.red.opacity(0.03))
                            .shadow(color: .gray.opacity(0.5) ,radius: 1, y: 3)
                    }
                    RoundedRectangle(cornerRadius: 0)
                        .frame(width: .infinity, height: 0.5)
                        .foregroundColor(Color.black.opacity(0.15))
                    
                    // Informações abaixo da imagem
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Feijoada tradicional")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            
                            Button {
                                withAnimation {
                                    recipe.isFav.toggle()
                                }
                            }label: {
                                if !recipe.isFav{
                                    Image(systemName: "star")
                                        .resizable()
                                        .frame(width: 30, height: 30).foregroundColor(Color(hex:"#FF2201"))
                                        //.offset(x: 167 ,y: -85)
                                } else {
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30).foregroundColor(Color(hex:"#FF2201"))
                                        //.offset(x: 167 ,y: -85)
                                }
                            }
                            .padding(.leading, 21)
                        }
                        
                        Text("Breve descrição da receita. Origem, curiosidades etc.")
                            .font(.body)
                            .foregroundColor(.secondary)
                        
                        Text("Passa a passo")
                            .font(.headline)
                        
                        Text("- Passo1")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Divider().foregroundColor(Color(hex: "#FF2201"))
                        
                        Text("Anotações")
                            .font(.headline)
                        
                        Text("# 4 colheres de sal, ao invés de 5")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                    }
                    .padding()
                }
                .padding(.top, -62.5)
            }
            //.navigationTitle("Detalhes da receita")
            //.navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
        
        Button {
            presentationMode.wrappedValue.dismiss()
        }label: {
            Image(systemName: "arrowshape.left.circle")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(Color(hex: "#FF2201"))
        }
        
    }
}

#Preview {
    RecipeView(recipe: recipeList[0])
}
