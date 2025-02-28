//
//  VegiesView.swift
//  Namassa
//
//  Created by found on 26/02/25.
//

import SwiftUI

struct VeggiesView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    //    @Binding var tags: [String]
    
//    @Binding var viewModel.selectedProteinType: SelectedType
    
    @State var selectedTags: Set<String> = []
    
    // TODO: Fazer igual na de carboidratos
    @State var ingredientType: String = ""
    var typesList: [String]{
        var result = viewModel.selectedVeggieType.getOptions()
        if !ingredientType.isEmpty {
            result = result.filter({ text in
                text.localizedStandardContains(ingredientType)
            })
        }
        print(result)
        return result
    }
    
    var body: some View {
        Text("\u{2022} Selecione os Vegetais")
            .font(.system(size: 20))
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            .padding(.bottom, 20)
        
        
        VStack(spacing: 15) {
            HStack(spacing:15){
                SelectButtonView(
                    buttonSelected: viewModel.selectedVeggieType == .leafs,
                    textColor: .white,
                    color: .red,
                    text: "Folhas"
                )
                    .onTapGesture {
                        if viewModel.selectedVeggieType == .leafs {
                            viewModel.selectedVeggieType = .none
                        } else {
                            viewModel.selectedVeggieType = .leafs
                        }

                        showVeggies()
                        
                        
                    }
                SelectButtonView(
                    buttonSelected: viewModel.selectedVeggieType == .roots,
                    textColor: .white,
                    color: .red,
                    text: "Raízes"
                )
                    .onTapGesture {
                        if viewModel.selectedVeggieType == .roots {
                            viewModel.selectedVeggieType = .none
                        } else {
                            viewModel.selectedVeggieType = .roots
                        }
//                            showSearch()
                        showVeggies()
                    }

                SelectButtonView(
                    buttonSelected: viewModel.selectedVeggieType == .fruits,
                    textColor: .white,
                    color: .red,
                    text: "Frutos"
                )
                    .onTapGesture {
                        if viewModel.selectedVeggieType == .fruits {
                            viewModel.selectedVeggieType = .none
                        } else {
                            viewModel.selectedVeggieType = .fruits
                        }
//                            showSearch()
                        showVeggies()
                    }

            }
            HStack(spacing:15){
                SelectButtonView(
                    buttonSelected: viewModel.selectedVeggieType == .nuts,
                    textColor: .white,
                    color: .red,
                    text: "Nozes"
                )
                .onTapGesture {
                    if viewModel.selectedVeggieType == .nuts {
                        viewModel.selectedVeggieType = .none
                    } else {
                        viewModel.selectedVeggieType = .nuts
                    }
//                        showSearch()
                    showVeggies()
                }

                SelectButtonView(
                    buttonSelected: viewModel.selectedVeggieType == .seeds,
                    textColor: .white,
                    color: .red,
                    text: "Sementes"
                )
                    .onTapGesture {
                        if viewModel.selectedVeggieType == .seeds {
                            viewModel.selectedVeggieType = .none
                        } else {
                            viewModel.selectedVeggieType = .seeds
                        }
                        
                        showVeggies()
                     
                    }

                SelectButtonView(
                    buttonSelected: viewModel.selectedVeggieType == .stems,
                    textColor: .white,
                    color: .red,
                    text: "Caules"
                )
                    .onTapGesture {
                        if viewModel.selectedVeggieType == .stems {
                            viewModel.selectedVeggieType = .none
                        } else {
                            viewModel.selectedVeggieType = .stems
                        }
                        showVeggies()
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
                        toggleSelectionV(for: element)
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
    private func toggleSelectionV(for tag: String){
        if selectedTags.contains(tag) {
            selectedTags.remove(tag)
        } else {
            selectedTags.insert(tag)
        }
    }
    private func showVeggies() {
//        if viewModel.selectedProteinType != .none{
//            typesList = viewModel.selectedProteinType.getOptions()
//        } else {
//            typesList = []
//        }
    }
    var searchVeggieTypes: [String]{
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
    VeggiesView()
        .environmentObject(viewModel)
}
