//
//  RecipeListView.swift
//  Namassa
//
//  Created by found on 31/01/25.
//

import SwiftUI

struct RecipeListView: View {
    @ObservedObject var viewModel = RecipeViewModel()
    @State var inputText = ""
    @State var seletedCarne = Carnes.all
       
    var body: some View {
        ScrollView(showsIndicators: false) {
                        LazyVStack {
                            ForEach(viewModel.recipeCard.filter({ recipe in
                                filterSearchText(recipe)
                            }).filter({ recipe in
                                filterCarnes(recipe)
                            }), id: \.self) { recipe in
                                RecipeCardView(recipe: recipe)
                            }
                        }
                    }
    }
    private func filterSearchText(_ recipe: RecipeModel) -> Bool {
            if inputText == "" || recipe.name.localizedCaseInsensitiveContains(inputText) {
                return true
            } else {
                return false
            }
        }
    private func filterCarnes(_ recipe: RecipeModel) -> Bool {
        if seletedCarne == .all || seletedCarne == recipe.meat
          {
              return true
          } else {
              return false
          }
      }
      
}

#Preview {
    RecipeListView()
}
