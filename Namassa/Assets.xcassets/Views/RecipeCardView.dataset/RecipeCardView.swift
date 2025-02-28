//
//  RecipeCardView.swift
//  Namassa
//
//  Created by found on 29/01/25.
//

import SwiftUI

struct RecipeCardView: View {
    let recipe: RecipeModel
    
    var body: some View {
            
                ZStack{
                    Image(recipe.imageURL)
                        .resizable()
                        .scaledToFit()
                        
                    ZStack {
                        VStack(alignment: .leading, content: {
                            HStack{
                                Text("\(recipe.name)")
                                    .font(.system(size: 33, weight: .semibold))
                                
        //                        Text(recipe.category)
        //                            .font(.callout)
        //                            .padding()
        //                            .background(.white.opacity(0.5))
        //                            .clipShape(Capsule())
                            }
                            //.padding()
                            
                            Spacer()
                            
                            Button {
                                //RecipeView
                            } label: {
                                HStack{
                                    Text("Detalhes")
                                        .font(.system(size: 23, weight: .semibold))
                                        .foregroundColor(.black)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(height: 80)
                                .background(.white.opacity(0.5))
                                .clipShape(Capsule())
                            }
                            
                            
                        })
                    }
                    
                }
                .padding(30)
                .frame(width: 336, height: 422)
                .clipShape(.rect(cornerRadius: 57))
                //.padding(.leading, 20)
            }
        }
    


#Preview {
  
}
