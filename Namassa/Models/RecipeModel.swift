//
//  RecipeModel.swift
//  Namassa
//
//  Created by found on 14/01/25.
//

import SwiftUI

struct RecipeModel: Identifiable, Hashable {
    var id: UUID = .init()
    var name: String
    var category: String
    var image: String
    var price: Int
    var color: Color
}

// Sample recipes
var recipeList = [
    RecipeModel(name: "Feijoada tradicional", category: "Ensopados" ,image: "Feijoada", price: 15, color: .brown),
    RecipeModel(name: "Uramaki", category: "Sushi", image: "Sushi", price: 10, color: .black),
    RecipeModel(name: "U", category: "Sushi",image: "Sushi", price: 10,color: .brown),
    RecipeModel(name: "Sushi", category: "Sushi",image: "Sushi", price: 10,color: .brown),
    RecipeModel(name: "Sushi", category: "Sushi",image: "Sushi", price: 10,color: .brown),
    RecipeModel(name: "Sushi", category: "Sushi",image: "Sushi", price: 10,color: .brown),
    RecipeModel(name: "Sushi", category: "Sushi",image: "Sushi", price: 10,color: .brown),
    RecipeModel(name: "Sushi", category: "Sushi",image: "Sushi", price: 10,color: .brown)
]



//var recipeList: [RecipeModel] = [
//    RecipeModel(icon: "", title: "All"),
//    RecipeModel(icon: "bread", title: "Dough"),
//    RecipeModel(icon: "milk", title: "Dairy"),
//    RecipeModel(icon: "meat", title: "Meats")
//]

