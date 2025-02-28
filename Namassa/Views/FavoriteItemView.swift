//
//  RecipeView.swift
//  Namassa
//
//  Created by found on 28/01/25.
//

import SwiftUI

struct FavoriteItemView: View {
    var recipe: RecipeModel
    
    var body: some View {
        NavigationLink(destination: RecipeView(recipe: recipe)) {
            ZStack {
                // O quadrado com sombra
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.black.opacity(1))
                    .shadow(color: .gray.opacity(0.9) ,radius: 1, x: 0.5)
                    .frame(width: 170, height: 170)
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.black.opacity(1))
                    .shadow(color: .gray.opacity(0.9) ,radius: 1, x: -0.5)
                    .frame(width: 170, height: 170)
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .shadow(color: .gray.opacity(0.5), radius: 1, x: 0, y: 8)
                    .frame(width: 170, height: 170)
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .shadow(color: .gray.opacity(0.5), radius: 1, x: 0, y: -1)
                    .frame(width: 170, height: 170)
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.red.opacity(0.02))
                    .frame(width: 170, height: 170)
                
                
                RoundedRectangle(cornerRadius: 0)
                    .fill(Color.gray.opacity(0.7))
                    .frame(width: 170, height: 1)
                    .scaledToFill()
                    .position(x: 86 ,y: 82)
                
                
                VStack(spacing: 0) {
                    // Parte superior com imagem e botão
                    ZStack(alignment: .topTrailing) {
                        Image(recipe.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 147.8, height: 82.11)
                            .clipped()
                            .offset(y: 9)
                        //.offset(x: -15)
                        Button {
                            recipe.isFav.toggle()
                        }label: {
                            ZStack{
                                if !recipe.isFav {
                                    Image(systemName: "star")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(Color(hex: "FF2201"))
                                } else {
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(Color(hex: "FF2201"))
                                }
                            }
                        }
                        .offset(x:5 ,y: 13)
                        
                        
                    }
                    
                    // Parte inferior com textos
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("\(recipe.name)")
                            .font(.headline)
                            .foregroundColor(.black)
                            .lineLimit(2)
                        
                        Text("Descrição ou informações adicionais sobre o item.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .frame(maxWidth: 170, maxHeight: 100, alignment: .topLeading)
                    .background(Color.white)
                    
                }//fim VStack de conteudo
                .clipShape(RoundedRectangle(cornerRadius: 16)) // Faz o arredondamento interno
            }//fim da ZStack maior
        }
    }
}


#Preview {
    FavoriteItemView(recipe: recipeList[0])
}
