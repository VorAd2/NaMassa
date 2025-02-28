//
//  RecipeViewModel.swift
//  Namassa
//
//  Created by found on 29/01/25.
//

import Foundation
import SwiftUI

class RecipeViewModel: ObservableObject {
    
    @Published var allRecipes = [RecipeModel]()
   var dbData = [RecipeModel]()
    init() {
        allRecipes = loadJsonFile()
    }
    
    private func loadJsonFile() -> [RecipeModel]{
        do {
            if let filePath  = Bundle.main.url(forResource: "RecipesDataBase", withExtension: "json") {
                
                let jsonData = try Data(contentsOf: filePath)
                let decodedData = try JSONDecoder().decode([RecipeModel].self, from: jsonData)
                print(decodedData)
                dbData = decodedData
            } else {
                return [RecipeModel]()
            }
        } catch let error {
            print("[System] Error while fetching: \(error)")
        }
        return dbData
    }
}
