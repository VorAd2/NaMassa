import SwiftUI

struct CarbsView: View {

    @State var selectedTags: Set<String> = []
    
    @EnvironmentObject var viewModel: ViewModel
    
    @State var ingredientType: String = ""
    
    var typesList: [String] {
        var result = viewModel.selectedCarbType.getOptions()
        if !ingredientType.isEmpty {
            result = result.filter({ text in
                text.localizedStandardContains(ingredientType)
            })
        }
        print(result)
        return result
    }
    
    var body: some View {
    
        VStack {
            
            Text("\u{2022} Selecione os Carboidratos")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .padding(.bottom, 20)
            
            
            VStack(spacing: 15) {
                HStack(spacing:15){
                    SelectButtonView(
                        buttonSelected: viewModel.selectedCarbType == .bread,
                        textColor: .white,
                        color: .red,
                        text: "Pão"
                    )
                        .onTapGesture {
                            if viewModel.selectedCarbType == .bread {
                                viewModel.selectedCarbType = .none
                            } else {
                                viewModel.selectedCarbType = .bread
                            }
//                            showSearch()
                            showCarbs()
                            
                            
                        }
                    SelectButtonView(
                        buttonSelected: viewModel.selectedCarbType == .rice,
                        textColor: .white,
                        color: .red,
                        text: "Arroz"
                    )
                        .onTapGesture {
                            if viewModel.selectedCarbType == .rice {
                                viewModel.selectedCarbType = .none
                            } else {
                                viewModel.selectedCarbType = .rice
                            }
//                            showSearch()
                            showCarbs()
                        }

                    SelectButtonView(
                        buttonSelected: viewModel.selectedCarbType == .pasta,
                        textColor: .white,
                        color: .red,
                        text: "Massas"
                    )
                        .onTapGesture {
                            if viewModel.selectedCarbType == .pasta {
                                viewModel.selectedCarbType = .none
                            } else {
                                viewModel.selectedCarbType = .pasta
                            }
//                            showSearch()
                            showCarbs()
                        }

                }
                HStack(spacing:15){
                    SelectButtonView(
                        buttonSelected: viewModel.selectedCarbType == .potato,
                        textColor: .white,
                        color: .red,
                        text: "Batatas"
                    )
                    .onTapGesture {
                        if viewModel.selectedCarbType == .potato {
                            viewModel.selectedCarbType = .none
                        } else {
                            viewModel.selectedCarbType = .potato
                        }
//                        showSearch()
                        showCarbs()
                    }

                    SelectButtonView(
                        buttonSelected: viewModel.selectedCarbType == .cereals,
                        textColor: .white,
                        color: .red,
                        text: "Cereais"
                    )
                        .onTapGesture {
                            if viewModel.selectedCarbType == .cereals {
                                viewModel.selectedCarbType = .none
                            } else {
                                viewModel.selectedCarbType = .cereals
                            }
                            
                            showCarbs()
                         
                        }

                    SelectButtonView(
                        buttonSelected: viewModel.selectedCarbType == .flour,
                        textColor: .white,
                        color: .red,
                        text: "Farinhas"
                    )
                        .onTapGesture {
                            if viewModel.selectedCarbType == .flour {
                                viewModel.selectedCarbType = .none
                            } else {
                                viewModel.selectedCarbType = .flour
                            }
                            showCarbs()
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
                            
                            toggleSelectionC(for: element)
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
//                .searchable(text: $ingredientType)
                //            GeometryReader { geometry in
                //
                //            }
            }
            
            Spacer()
            
            

        }
    }
//    private func showSearch(){
//        if selectedType != .none{
//            SearchBarView(ingredientType: $ingredientType)
//        }
//    }
    private func toggleSelectionC(for tag: String){
        if selectedTags.contains(tag) {
            selectedTags.remove(tag)
        } else {
            selectedTags.insert(tag)
        }
    }
    private func showCarbs() {
//        if selectedType != .none{
//            typesList = selectedType.getOptions()
//        } else {
//            typesList = []
//        }
    }
    var searchCarbTypes: [String]{
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
            isSelected ? /*Color(hex: "FF500B")*/ .red : Color(hex:"CDCDCD")
            HStack {
                Spacer()
                Text(title)
                    .foregroundColor(isSelected ? .white : .black)
                Spacer()
            }
                .padding(.horizontal,12)
                .padding(.vertical,8)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    @Previewable @StateObject var viewModel = ViewModel()
    @Previewable @State var ingredientType: String = ""
    CarbsView()
        .environmentObject(viewModel)
}
