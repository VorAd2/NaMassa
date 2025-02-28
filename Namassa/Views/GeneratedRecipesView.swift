//
//  GeneratedRecipesView.swift
//  Namassa
//
//  Created by found on 14/02/25.
//

import SwiftUI

struct GeneratedRecipesView: View {
    private let flexibleColumn = [
        GridItem(.fixed(170), spacing: 28),
        GridItem(.fixed(170))
    ]
    
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "arrow.left.circle")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .leading)
                    .padding(.leading)
                    
                
                //Spacer()
                
                Text("Receitas")
                    .font(.system(size: 38))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.trailing, 50)
                
                //Spacer()
            }
            .padding(.bottom, 30)
            
            //Spacer()
            
            ScrollView {
                LazyVGrid(columns: flexibleColumn, spacing: 15) {
                    ForEach(recipeList.indices, id: \.self) { index in
                        FavoriteItemView(recipe: recipeList[index])
                    }
                }
            }
            
            Text("TOOLBAR")
        }//fim da grande VStack
        
    }
}

#Preview {
    GeneratedRecipesView()
}
