//
//  RecipeView.swift
//  Namassa
//
//  Created by found on 30/01/25.
//

import SwiftUI

struct RecipeView: View {
    
    @AppStorage("favorites") var favorites = "" // [1][2]
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: ViewModel
    
    let recipe: RecipeModel
    
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
                            Text(recipe.name)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            
                            let isFavorite = favorites.contains("[\(recipe.id)]")
                             
                            Spacer()
                            
                            Button {
                                if isFavorite {
                                    favorites.replace("[\(recipe.id)]", with: "")
                                } else {
                                    favorites.append("[\(recipe.id)]")
                                }
//                                withAnimation {
//                                    recipe.toggle()
//                                }
                            }label: {
                                if !isFavorite {
                                    Image(systemName: "heart")
                                        .resizable()
                                        .frame(width: 30, height: 30).foregroundColor(Color(hex:"#FF2201"))
                                        //.offset(x: 167 ,y: -85)
                                } else {
                                    Image(systemName: "heart.fill")
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
                        
                        Text("Ingredientes")
                            .font(.headline)
//                            .fontWeight()
                        
                        ForEach(recipe.ingredients, id: \.self) { ingredient in
                            HStack{
                                Text("\u{2022}")
                                Text(ingredient)
                            }
                        }//                        Text("- Passo1")
//                            .font(.subheadline)
//                            .foregroundColor(.secondary)
                        
                        Divider().foregroundColor(Color(hex: "#FF2201"))
                        
                        Text("Modo de preparo")
                            .font(.headline)
                        
                        let url = Bundle.main.path(forResource: "\(recipe.id)", ofType: "txt")
                        
                        if let url, let contents = try? String(contentsOfFile: url, encoding: .utf8) {
                            Text(contents)
                                .font(.subheadline)
                                .fontWeight(.regular)
                        }
                        
                        
                        
                    }
                    .padding()
                }
                .padding(.top, -62.5)
            }
            //.navigationTitle("Detalhes da receita")
            //.navigationBarTitleDisplayMode(.inline)
//            .navigationBarBackButtonHidden(true)
//            .onAppear{
//                do{
//                    let res = try StaticJSONMapper.decode
//                }
//            }
        
//        Button {
//            presentationMode.wrappedValue.dismiss()
//        }label: {
//            Image(systemName: "arrowshape.left.circle")
//                .resizable()
//                .frame(width: 40, height: 40)
//                .foregroundColor(Color(hex: "#FF2201"))
//        }
        
    }
}

#Preview {
    @Previewable @StateObject var viewModel = ViewModel()
    RecipeView(recipe: .init(id: 1, image: "Cookie", ingredients: ["Carne", "oki"], name: "Cookies", tags: ["Carne Moída"]))
        .environmentObject(viewModel)
}
