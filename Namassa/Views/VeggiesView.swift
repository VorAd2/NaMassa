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
    @State var typesList: [String] = []
    
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
                    buttonSelected: viewModel.selectedProteinType == .leafs,
                    textColor: .white,
                    color: .red,
                    text: "Folhas"
                )
                    .onTapGesture {
                        if viewModel.selectedProteinType == .leafs {
                            viewModel.selectedProteinType = .none
                        } else {
                            viewModel.selectedProteinType = .leafs
                        }

                        showProtein()
                        
                        
                    }
                SelectButtonView(
                    buttonSelected: viewModel.selectedProteinType == .roots,
                    textColor: .white,
                    color: .red,
                    text: "Raízes"
                )
                    .onTapGesture {
                        if viewModel.selectedProteinType == .roots {
                            viewModel.selectedProteinType = .none
                        } else {
                            viewModel.selectedProteinType = .roots
                        }
//                            showSearch()
                        showProtein()
                    }

                SelectButtonView(
                    buttonSelected: viewModel.selectedProteinType == .fruits,
                    textColor: .white,
                    color: .red,
                    text: "Frutos"
                )
                    .onTapGesture {
                        if viewModel.selectedProteinType == .fruits {
                            viewModel.selectedProteinType = .none
                        } else {
                            viewModel.selectedProteinType = .fruits
                        }
//                            showSearch()
                        showProtein()
                    }

            }
            HStack(spacing:15){
                SelectButtonView(
                    buttonSelected: viewModel.selectedProteinType == .nuts,
                    textColor: .white,
                    color: .red,
                    text: "Nozes"
                )
                .onTapGesture {
                    if viewModel.selectedProteinType == .nuts {
                        viewModel.selectedProteinType = .none
                    } else {
                        viewModel.selectedProteinType = .nuts
                    }
//                        showSearch()
                    showProtein()
                }

                SelectButtonView(
                    buttonSelected: viewModel.selectedProteinType == .seeds,
                    textColor: .white,
                    color: .red,
                    text: "Sementes"
                )
                    .onTapGesture {
                        if viewModel.selectedProteinType == .seeds {
                            viewModel.selectedProteinType = .none
                        } else {
                            viewModel.selectedProteinType = .seeds
                        }
                        
                        showProtein()
                     
                    }

                SelectButtonView(
                    buttonSelected: viewModel.selectedProteinType == .stems,
                    textColor: .white,
                    color: .red,
                    text: "Caules"
                )
                    .onTapGesture {
                        if viewModel.selectedProteinType == .stems {
                            viewModel.selectedProteinType = .none
                        } else {
                            viewModel.selectedProteinType = .stems
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
                ForEach(searchProteinTypes, id: \.self) { element in
                    TagView(
                        title: element,
                        isSelected: viewModel.tags.contains(element)
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
            .searchable(text: $ingredientType)
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
    private func showVeggies() {
        if viewModel.selectedProteinType != .none{
            typesList = viewModel.selectedProteinType.getOptions()
        } else {
            typesList = []
        }
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
    VegiesView()
}
