import SwiftUI
import Foundation
import SwiftData

struct RecipeModel: Identifiable, Hashable, Codable{
    var id: Int
    var image: String
    var ingredients: [String]
    
    var name: String
    var tags: [String]
    
}
