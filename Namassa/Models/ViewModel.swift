//
//  Datas.swift
//  Namassa
//
//  Created by found on 24/02/25.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var tags: [String] = []
    @Published var selectedCarbType: SelectedType = .none
    @Published var selectedProteinType: SelectedType = .none
    @Published var selectedVeggieType: SelectedType = .none
    @Published var recipe: RecipeModel = .init(id: 0, image: "", ingredients: [], name: "", tags: [])
    @Published var goToRecipe: Bool = false
//    @Published var recipeViewModel = RecipeViewModel()
}
