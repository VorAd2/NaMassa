//
//  File.swift
//  Namassa
//
//  Created by found on 24/02/25.
//

import Foundation

enum SelectedType {
    case meat
    case poultry
    case pork
    case fish
    case vegan
    case seafood
    
    case bread
    case rice
    case pasta
    case potato
    case cereals
    case flour

    case nuts
    case leafs
    case roots
    case fruits
    case seeds
    case stems
    
    case none
    case allCarbs
    case allProteins
    
    func getOptions() -> [String] {
        
        switch self {
        case .bread:
            return ["Pão Francês", "Fast"]
        case .rice:
            return ["Arroz branco", "Arroz parboilizado"]
        case .pasta:
            return ["Fettucine", "Spaguetti"]
        case .potato:
            return ["Batata doce", "Batata inglesa"]
        case .cereals:
            return ["Lentilha", "Chia"]
        case .flour:
            return ["Farinha de Trigo", "Farinha de Mandioca"]
        case .none:
            return []
        case .allCarbs:
            return [
                "Pão Francês", "Fast",
                "Arroz branco", "Arroz parboilizado",
                "Fettucine", "Spaguetti",
                "Batata doce", "Batata inglesa",
                "Lentilha", "Chia",
                "Banana prata", "Banana da terra"
                
            ]
        case .meat:
            return ["Carne Moída", "Filé Mignon", "Contra-filé"]
        case .poultry:
            return ["Coxa de Frango", "Sobrecoxa de Frango", "Peito de Pato", "Ovo"]
        case .pork:
            return ["Copalombo", "Lombo", "Bacon", "Panceta"]
        case .fish:
            return ["Pargo", "Pirarucu", "Tilápia", "Sardinha"]
        case .vegan:
            return ["Tofu", "Proteína de Soja"]
        case .seafood:
            return ["Camarão", "Lagosta", "Ostra", "Mexilhão"]
        case .allProteins:
            return ["Carne Moída", "Filé Mignon", "Contra-filé",
                    "Coxa de Frango", "Sobrecoxa de Frango", "Peito de Pato",
                    "Copalombo", "Lombo", "Bacon", "Panceta",
                    "Pargo", "Pirarucu", "Tilápia", "Sardinha",
                    "Tofu", "Proteína de Soja",
                    "Camarão", "Lagosta", "Ostra", "Mexilhão"
            ]
        case .nuts:
            return ["Castanha do Pará", "Castanha de Caju", "Amêndoa"]
        case .leafs:
            return ["Rúcula", "Alface", "Acelga", "Repolho"]
        case .roots:
            return ["Cenoura", "Rabanete", "Inhame"]
        case .fruits:
            return ["Maçã", "Laranja"]
        case .seeds:
            return ["Linhaça", "Gergelim"]
        case .stems:
            return ["Palmito Pupunha"]
        }
    }
}

