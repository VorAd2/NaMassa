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
    private let flexibleColumn = [
        GridItem(.fixed(170), spacing: 28),
        GridItem(.fixed(170))
    ]
    
    @Environment(\.modelContext) var modelContext
    @Query var persRecipes: [RecipeModel]
    var favRecipes: [RecipeModel] = []
    
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
                        ForEach(favRecipes.indices, id: \.self) { index in
                            FavoriteItemView(recipe: favRecipes[index])
                        }
                    }
                }
                
                
                Text("TOOLBAR")
                
            }//fim VStack
        }
    }
}

#Preview {
    FavoritesView()
}


//extension FavoritesView{
//    private func pairedItems<T>(_ items: [T]) -> [(first: T?, second: T?)] {
//        var result: [(first: T?, second: T?)] = []
//        let chunks = stride(from: 0, to: items.count, by: 2)
//        for index in chunks {
//            let first = items[index]
//            let second = index + 1 < items.count ? items[index + 1] : nil
//            result.append((first, second))
//        }
//        return result
//    }
//
//}


//                      TextField("Digite algo...", text: $search)
//                            .padding(.vertical, 8)
//                            .background(
//                                VStack {
//                                    Spacer()
//                                    Rectangle()
//                                        .frame(height: 3)
//                                        .foregroundColor(.black)
//                                        .cornerRadius(2)
//                                }
//                            )
//                            .padding(.horizontal, 4)
//
//                        Spacer()
//
//                        Image(systemName: "magnifyingglass")
