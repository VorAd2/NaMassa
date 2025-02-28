//
//  ProteinView.swift
//  Namassa
//
//  Created by found on 24/02/25.
//

import SwiftUI

struct ProteinView: View {
    @EnvironmentObject var viewModel: ViewModel
    //    @Binding var tags: [String]
    
//    @Binding var viewModel.selectedProteinType: SelectedType
    
    @State var selectedTags: Set<String> = []
    
    // TODO: Fazer igual na de carboidratos
    @State var ingredientType: String = ""
    var typesList: [String]
    {
        var result = viewModel.selectedProteinType.getOptions()
        if !ingredientType.isEmpty {
            result = result.filter({ text in
                text.localizedStandardContains(ingredientType)
            })
        }
        print(result)
        return result
    }
    
    var body: some View {
        Text("\u{2022} Selecione as Proteínas")
            .font(.system(size: 20))
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            .padding(.bottom, 20)
        
        
        VStack(spacing: 15) {
            HStack(spacing:15){
                SelectButtonView(
                    buttonSelected: viewModel.selectedProteinType == .meat,
                    textColor: .white,
                    color: .red,
                    text: "Bovina"
                )
                    .onTapGesture {
                        if viewModel.selectedProteinType == .meat {
                            viewModel.selectedProteinType = .none
                        } else {
                            viewModel.selectedProteinType = .meat
                        }
//                            showSearch()
                        showProtein()
                        
                        
                    }
                SelectButtonView(
                    buttonSelected: viewModel.selectedProteinType == .poultry,
                    textColor: .white,
                    color: .red,
                    text: "Aves"
                )
                    .onTapGesture {
                        if viewModel.selectedProteinType == .poultry {
                            viewModel.selectedProteinType = .none
                        } else {
                            viewModel.selectedProteinType = .poultry
                        }
//                            showSearch()
                        showProtein()
                    }

                SelectButtonView(
                    buttonSelected: viewModel.selectedProteinType == .fish,
                    textColor: .white,
                    color: .red,
                    text: "Peixes"
                )
                    .onTapGesture {
                        if viewModel.selectedProteinType == .fish {
                            viewModel.selectedProteinType = .none
                        } else {
                            viewModel.selectedProteinType = .fish
                        }
//                            showSearch()
                        showProtein()
                    }

            }
            HStack(spacing:15){
                SelectButtonView(
                    buttonSelected: viewModel.selectedProteinType == .pork,
                    textColor: .white,
                    color: .red,
                    text: "Suínos"
                )
                .onTapGesture {
                    if viewModel.selectedProteinType == .pork {
                        viewModel.selectedProteinType = .none
                    } else {
                        viewModel.selectedProteinType = .pork
                    }
//                        showSearch()
                    showProtein()
                }

                SelectButtonView(
                    buttonSelected: viewModel.selectedProteinType == .seafood,
                    textColor: .white,
                    color: .red,
                    text: "Maríscos"
                )
                    .onTapGesture {
                        if viewModel.selectedProteinType == .seafood {
                            viewModel.selectedProteinType = .none
                        } else {
                            viewModel.selectedProteinType = .seafood
                        }
                        
                        showProtein()
                     
                    }

                SelectButtonView(
                    buttonSelected: viewModel.selectedProteinType == .vegan,
                    textColor: .white,
                    color: .red,
                    text: "Vegano"
                )
                    .onTapGesture {
                        if viewModel.selectedProteinType == .vegan {
                            viewModel.selectedProteinType = .none
                        } else {
                            viewModel.selectedProteinType = .vegan
                        }
                        showProtein()
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
                ForEach(typesList, id: \.self) { element in
                    TagView(
                        title: element,
                        isSelected: viewModel.tags.contains(element)
                    )
           
                    .frame(width: 363)
                    .scaleEffect(selectedTags.contains(element) ? 0.9 : 1.0)
                    .onTapGesture{
                        toggleSelectionP(for: element)
                        // ["a", "a", "b"]
                        if viewModel.tags.contains(element) {
                            viewModel.tags.removeAll { each in
                                each == element
                            }
                        } else {
                            viewModel.tags.append(element)
                        }
                    }
                    .animation(.spring, value: selectedTags.contains( element))
                  
                }
                
            }
            .scrollIndicators(.hidden)
//            .searchable(text: $ingredientType)
            //            GeometryReader { geometry in
            //
            //            }
        }
        
        Spacer()
        
        
//        ZStack {
//            RoundedRectangle(cornerRadius: 10)
//                .frame(width: 193, height: 70)
//                .foregroundColor(Color(hex: "E3A09F"))
//            Text("\(viewModel.tags)")
//                .fontWeight(.semibold)
//                .font(.system(size: 34))
//        }.padding(.bottom, 40)
    }
    private func toggleSelectionP(for tag: String){
        if selectedTags.contains(tag) {
            selectedTags.remove(tag)
        } else {
            selectedTags.insert(tag)
        }
    }
    private func showProtein() {
//        if viewModel.selectedProteinType != .none{
//            typesList = viewModel.selectedProteinType.getOptions()
//        } else {
//            typesList = []
//        }
    }
    var searchProteinTypes: [String]{
        if ingredientType.isEmpty{
            return typesList
        } else{
            return typesList.filter{ $0.contains(ingredientType)}
        }
    }
}
   

#Preview {
    @Previewable @StateObject var viewModel = ViewModel()
    @Previewable @State var tags: [String] = []
    @Previewable @State var ingredientType: String = ""
    @Previewable @State var selectedType: SelectedType = .none
    @Previewable @State var selectedTags: Set<String> = []
    @Previewable @State var typesList: [String] = []
    
    ProteinView()
        .environmentObject(viewModel)
}
