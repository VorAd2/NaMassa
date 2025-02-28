//
//  File.swift
//  Namassa
//
//  Created by found on 24/02/25.
//

import Foundation

enum SelectedType {
    case bread
    case rice
    case pasta
    case potato
    case cereals
    case banana
    case none
    case all
    
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
        case .banana:
            return ["Banana prata", "Banana da terra"]
        case .none:
            return []
        case .all:
            return [
                "Pão Francês", "Fast",
                "Arroz branco", "Arroz parboilizado",
                "Fettucine", "Spaguetti",
                "Batata doce", "Batata inglesa",
                "Lentilha", "Chia",
                "Banana prata", "Banana da terra"
                
            ]
        }
    }
}
