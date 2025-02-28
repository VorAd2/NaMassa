//
//  RecipeListView.swift
//  Namassa
//
//  Created by found on 31/01/25.
//

import SwiftUI

struct RecipeListView: View {
    
    @StateObject var recipeViewModel =  RecipeViewModel()
    @EnvironmentObject var viewModel: ViewModel
    @State var inputText = ""
//    @State var seletedCarne = Carnes.all
//    @Binding var recipe: RecipeModel
    @State var tags: [String] = []
    private let flexibleColumn = [
        GridItem(.fixed(170), spacing: 28),
        GridItem(.fixed(170))
    ]

    func recipes() -> [RecipeModel] {
        
//        var recipes: [RecipeModel] = []
//
//        if tags.isEmpty {
//            recipes.append(contentsOf: viewModel.allRecipes)
//        } else {
//            for recipe in  viewModel.allRecipes {
//                for tag in recipe.tags {
//                    if tags.contains(tag) {
//                        recipes.append(recipe)
//                    }
//                }
//            }
//        }
//
//        return recipes
        
        if viewModel.tags.isEmpty {
            return recipeViewModel.allRecipes
        } else {
            return recipeViewModel.allRecipes.filter { recipe in
                return recipe.tags.contains { tag in
                    viewModel.tags.contains(tag)
                }
            }
        }
        
    }
    var body: some View {
        
        VStack {
            HStack{
                Text("Sugestões")
                    .font(.title)
                    .fontWeight(.bold)
            }
//            HStack
//            Text("\(tags)")
//            CarnesView(tags: $tags)
        ScrollView(showsIndicators: false) {
            
            LazyVGrid(columns: flexibleColumn, spacing: 15){
                ForEach(recipes(), id: \.self) { recipe in
                    FavoriteItemView(recipe: recipe)
                }
            }
            
        }
    }
        

        }
        
    }
    
  


extension Image {
    init(stringURL: String) {
        let name = String(stringURL.split(separator: ".")[0])
        let ext = String(stringURL.split(separator: ".")[1])
        var uiImage = UIImage()

        do {
            if let filePath = Bundle.main.url(
                forResource: name, withExtension: ext)
            {
                let imageData = try Data(contentsOf: filePath)
                uiImage = UIImage(data: imageData)!
            } else {
            }
        } catch let error {
            print("[System] Error while bring local image: \(error)")
            self.init(systemName: "xmark")
        }
        self.init(uiImage: uiImage)
    }
}

#Preview {
    @Previewable @StateObject var viewModel = ViewModel()
    RecipeListView()
        .environmentObject(viewModel)
}
