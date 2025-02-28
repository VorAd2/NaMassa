//
//  GeneratedRecipesView.swift
//  Namassa
//
//  Created by found on 14/02/25.
//

import SwiftUI

struct GeneratedRecipesView: View {
//    @Binding var recipe: RecipeModel
    @EnvironmentObject var viewModel: ViewModel
    var recipeViewModel =  RecipeViewModel()
    private let flexibleColumn = [
        GridItem(.fixed(170), spacing: 28),
        GridItem(.fixed(170))
    ]
    
    var body: some View {
        VStack{
            HStack {
//                Image(systemName: "arrow.left.circle")
//                    .resizable()
//                    .frame(width: 40, height: 40, alignment: .leading)
//                    .padding(.leading)
                    
                
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
                    ForEach(recipeViewModel.allRecipes, id: \.id) { recipe in
                        FavoriteItemView(recipe: recipe)
                    }
                }
            }
            
  
        }//fim da grande VStack
        
    }
}
//
#Preview {
    @Previewable @StateObject var viewModel = ViewModel()
    GeneratedRecipesView()
        .environmentObject(viewModel)
}
