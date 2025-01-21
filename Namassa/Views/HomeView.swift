//
//  HomeView.swift
//  Namassa
//
//  Created by found on 14/01/25.
//

import SwiftUI

struct HomeView: View {
    //RecipeView properties
    //@State var selectedRecipe = ""
    
    var body: some View {
        ScrollView{
            
            VStack{
                
                //Header
                HStack{
                    Button {
                        //ProfileView
                    } label: {
                        Image(systemName: "person")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70, height: 90)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                            .foregroundColor(.black)
                    }
                    
                    
                    Spacer()
                    
                    Text("Mãos na massa!")
                        .font(.system(size: 38))
                    
                    Spacer()
                    
                    Button {
                        //SearchView
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70, height: 90)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                            .foregroundColor(.black)
                    }
                }
                // Recipe List
                //RecipeListView
                
                HStack{
                    Text("**Populares**")
                        .font(.system(size: 26))
                        .underline()
                    
                    Spacer()
                    
                    Image(systemName: "arrow.right")
                        .imageScale(.large)
                }
                .padding(.horizontal, -10)
                .padding(.vertical, 18)
                
                //Recipe list
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(recipeList, id: \.id){ item in
                            RecipeCard(recipe: item)
                        }
                    }
                }
                
                HStack{
                    Text("**Descubra**")
                        .font(.system(size: 26))
                        .underline()
                    
                    Spacer()
                    
                    Image(systemName: "arrow.right")
                        .imageScale(.large)
                }
                .padding(.horizontal, -10)
                .padding(.vertical, 18)
                
                //Recipe list
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(recipeList, id: \.id){ item in
                            RecipeCard(recipe: item)
                        }
                    }
                }
                
            }//fim VStack
            .padding(20)
        }
    }
    

    
    
}

#Preview {
    HomeView()
}


// Recipe Card View
struct RecipeCard: View {
    
    var recipe: RecipeModel
    
    var body: some View {
        ZStack{
            Image(recipe.image)
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
        .background(recipe.color.opacity(0.2))
        .clipShape(.rect(cornerRadius: 57))
        //.padding(.leading, 20)
    }
}
