//
//  FavoritesView.swift
//  Namassa
//
//  Created by found on 24/01/25.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    
   
    @State private var search = ""
    @EnvironmentObject var viewModel: ViewModel
    private let flexibleColumn = [
        GridItem(.fixed(170), spacing: 28),
        GridItem(.fixed(170))
    ]
    @AppStorage("favorites") var favorites = ""
    
    @Environment(\.modelContext) var modelContext
//    @Query var persRecipes: [RecipeModel]
//    @Binding var favRecipes: [RecipeModel]
    
    var recipeViewModel = RecipeViewModel()
    
    var body: some View {
        NavigationView{
            VStack(spacing: 40) {
                HStack {
                    Text("Favoritos")
                        .font(.system(size: 38))
                   Spacer()
                }.padding(.top, 5)
                    .padding(.leading, 25)
                
                VStack(alignment: .leading) {
                    HStack{
                        FieldView(symbol: "magnifyingglass", message: "Pesquisar receita", txt: $search)
                    }
                   
                }
                .padding(.horizontal, 16)
                
                //Possivel espaco para pastas
                //Comand Shift L
                
                HStack(spacing: 15){
                    Spacer()
                    Image(systemName: "line.3.horizontal.decrease")
                    Text("Frequência de visita")
                    Rectangle()
                        .frame(width: 2, height: 25)
                        .foregroundColor(.black)
                        .cornerRadius(2)
                    Image(systemName: "arrow.down")
                }
                .padding(.horizontal, 18)
                .padding(.bottom, -5)
                
                
                ScrollView {
                    LazyVGrid(columns: flexibleColumn, spacing: 15) {
                        
                        var result = recipeViewModel.allRecipes.filter { recipe in
                            favorites.contains("[\(recipe.id)]")
                            
                            
//                            result = result.filter({ text in
//                                text.localizedStandardContains(ingredientType)
//                            })
                        }
                        
                        let favoriteRecipes = !search.isEmpty ? result.filter { rec in
                            rec.name.localizedStandardContains(search)
                        } : result

                                                
                        
                        ForEach(favoriteRecipes) { recipe in
                            FavoriteItemView(recipe: recipe)
                        }
                    }
                }
                
                
             
                
            }//fim VStack
        }
    }
}

#Preview {
    @Previewable @StateObject var viewModel = ViewModel()
    FavoritesView()
        .environmentObject(viewModel)
}


