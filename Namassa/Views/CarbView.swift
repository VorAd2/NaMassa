//
//  IngredientsSelectionView.swift
//  Namassa
//
//  Created by found on 14/02/25.
//

import SwiftUI

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

struct IngredientsSelectionView: View {
//    @State var searchText = ""
    @State var selectedType: SelectedType = .none
    
    @State var selectedTags: Set<String> = []
    @Binding var tags: [String]
    @Binding var ingredientType: String {
        didSet {
            print(ingredientType)
            typesList = selectedType.getOptions().filter({ text in
                ingredientType == text
            })
        }
    }
    
    @State var typesList: [String] = []
    
    var body: some View {
    
        VStack {
            Text("Monte seu prato")
                .font(.system(size: 30))
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
                .padding(.leading, 50)
                .padding(.bottom, 40)
            
            Text("\u{2022} Selecione os carboidratos")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .padding(.bottom, 20)
            
            
            VStack(spacing: 15) {
                HStack(spacing:15){
                    SelectButtonView(
                        buttonSelected: selectedType == .bread,
                        textColor: .white,
                        color: .red,
                        text: "Pão"
                    )
                        .onTapGesture {
                            if selectedType == .bread {
                                selectedType = .none
                            } else {
                                selectedType = .bread
                            }
//                            showSearch()
                            showTypes()
                            
                            
                        }
                    SelectButtonView(
                        buttonSelected: selectedType == .rice,
                        textColor: .white,
                        color: .red,
                        text: "Arroz"
                    )
                        .onTapGesture {
                            if selectedType == .rice {
                                selectedType = .none
                            } else {
                                selectedType = .rice
                            }
//                            showSearch()
                            showTypes()
                        }

                    SelectButtonView(
                        buttonSelected: selectedType == .pasta,
                        textColor: .white,
                        color: .red,
                        text: "Massas"
                    )
                        .onTapGesture {
                            if selectedType == .pasta {
                                selectedType = .none
                            } else {
                                selectedType = .pasta
                            }
//                            showSearch()
                            showTypes()
                        }

                }
                HStack(spacing:15){
                    SelectButtonView(
                        buttonSelected: selectedType == .potato,
                        textColor: .white,
                        color: .red,
                        text: "Batatas"
                    )
                    .onTapGesture {
                        if selectedType == .potato {
                            selectedType = .none
                        } else {
                            selectedType = .potato
                        }
//                        showSearch()
                        showTypes()
                    }

                    SelectButtonView(
                        buttonSelected: selectedType == .cereals,
                        textColor: .white,
                        color: .red,
                        text: "Cereais"
                    )
                        .onTapGesture {
                            if selectedType == .cereals {
                                selectedType = .none
                            } else {
                                selectedType = .cereals
                            }
                            
                            showTypes()
                         
                        }

                    SelectButtonView(
                        buttonSelected: selectedType == .banana,
                        textColor: .white,
                        color: .red,
                        text: "Banana"
                    )
                        .onTapGesture {
                            if selectedType == .banana {
                                selectedType = .none
                            } else {
                                selectedType = .banana
                            }
                            showTypes()
                        }

                }
            }.padding(.bottom, 25)
            
            
           
            
//            FarinhasView(options: selectedType.getOptions(), tags: .constant([]))
            VStack{
                Text("\u{2022} Qual o tipo?")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.bottom, 20)
                
                HStack {
                    TextField("Digite aqui..." ,text: $ingredientType)
                        .autocapitalization(.none)
                        .padding(.leading, 25)
                    Image(systemName: "magnifyingglass")
                        .padding(.trailing, 20)
                }
                RoundedRectangle(cornerRadius: 0)
                    .frame(width: 380, height: 1)
                    .padding(.bottom)
                
                ScrollView {
                    ForEach(searchTypes, id: \.self) { element in
                        TagView(
                            title: element,
                            isSelected: tags.contains(element)
                        )
                        //                    ZStack {
                        //                        tags.contains(element) ? .orange : Color(hex:"CDCDCD")
                        //
                        //                        HStack {
                        //                            Spacer()
                        //                            Text(element)
                        //                            Spacer()
                        //                        }
                        //                            .padding(.horizontal,12)
                        //                            .padding(.vertical,8)
                        //                    }
                        //                    .fixedSize()
                        .frame(width: 363)
                        .scaleEffect(selectedTags.contains(element) ? 0.9 : 1.0)
                        .onTapGesture{
                            toggleSelection(for: element)
                            // ["a", "a", "b"]
                            if tags.contains(element) {
                                tags.removeAll { each in
                                    each == element
                                }
                            } else {
                                tags.append(element)
                            }
                        }
                        .animation(.spring, value: selectedTags.contains( element))
                      
                    }
                    
                }
                .scrollIndicators(.hidden)
                .searchable(text: $ingredientType)
                //            GeometryReader { geometry in
                //
                //            }
            }
            
            Spacer()
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 193, height: 70)
                    .foregroundColor(Color(hex: "E3A09F"))
                Text("Próxima")
                    .fontWeight(.semibold)
                    .font(.system(size: 34))
            }.padding(.bottom, 40)
        }
    }
//    private func showSearch(){
//        if selectedType != .none{
//            SearchBarView(ingredientType: $ingredientType)
//        }
//    }
    private func toggleSelection(for tag: String){
        if selectedTags.contains(tag) {
            selectedTags.remove(tag)
        } else {
            selectedTags.insert(tag)
        }
    }
    private func showTypes() {
        if selectedType != .none{
            typesList = selectedType.getOptions()
        } else {
            typesList = []
        }
    }
    var searchTypes: [String]{
        if ingredientType.isEmpty{
            return typesList
        } else{
            return typesList.filter{ $0.contains(ingredientType)}
        }
    }

}

//struct IngredientRect: View {
//    let text: String
//
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 10)
//                .frame(width: 113, height: 61)
//                .foregroundColor(Color(hex: "E3A09F"))
//            Text(text)
//                .fontWeight(.medium)
//                .font(.system(size: 24))
//        }
//    }
//}

struct TagView: View {
    let title: String
    let isSelected: Bool
    var body: some View {
        ZStack {
            isSelected ? .orange : Color(hex:"CDCDCD")
            HStack {
                Spacer()
                Text(title)
                Spacer()
            }
                .padding(.horizontal,12)
                .padding(.vertical,8)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
//struct SearchBarView: View {
//    @Binding var ingredientType: String
//    var body: some View{
//        Text("\u{2022} Qual o tipo?")
//            .font(.system(size: 20))
//            .fontWeight(.bold)
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .padding(.leading)
//            .padding(.bottom, 20)
//        
//        HStack {
//            TextField("Digite aqui..." ,text: $ingredientType)
//                .autocapitalization(.none)
//                .padding(.leading, 25)
//            Image(systemName: "magnifyingglass")
//                .padding(.trailing, 20)
//        }
//        RoundedRectangle(cornerRadius: 0)
//            .frame(width: 380, height: 1)
//            .padding(.bottom)
//    }
//}
#Preview {
    @Previewable @State var tags: [String] = []
    @Previewable @State var ingredientType: String = ""
    IngredientsSelectionView(tags: $tags, ingredientType: $ingredientType)
}
