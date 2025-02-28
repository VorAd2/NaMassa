//
//  CustomNavBarView.swift
//  Namassa
//
//  Created by found on 21/02/25.
//

import SwiftUI

struct CustomNavBarView: View {
    
    let current: CurrentView
    
    var voltar: (() -> Void)?
    var prox: (() -> Void)?
    @Binding var goToRecipe: Bool
    @State var showBackButton: Bool = true
    @State var showNextButton: Bool = true
    @State var title: String = ""
    @State var subTitle: String? = nil
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack{
//            Spacer()
            HStack{
                backButton
                Spacer()
                titleSection
                Spacer()
                nextButton
            }.frame(height: 60)
            .padding()
            .font(.headline)
            .background(
                Color.white.ignoresSafeArea(edges: .top)
            )
            Divider()
        }
        
    }
}
extension CustomNavBarView {
    private var backButton: some View {
        Button{
            voltar?()
        } label:{
            Image(systemName: "chevron.left")
//                .resizable()
//                .frame(width: 16, height: 16)
        }
    }
    private var nextButton: some View {
        Button(action: {
            prox?()
           }) {
               if current == .veggieView {
                   HStack{
                       Text("Receitas")
                       Image(systemName: "chevron.right")
                   }
               } else {
                   Image(systemName: "chevron.right")
               }
//           }.navigationDestination(isPresented: $goToRecipe) {
//               RecipeListView()
           }
//        Button{
//            prox?()
//        } label:{
//            if current == .veggieView {
//               
//            } else {
//                Image(systemName: "chevron.right")
//            }
//        }
    }
    private var titleSection: some View{
        VStack(spacing: 4){
            Text("Monte seu Prato")
                .font(.title)
                .fontWeight(.semibold)
           
        }
    }

}

#Preview {
    @Previewable @StateObject var viewModel = ViewModel()
    @Previewable @State var goToRecipe: Bool = false
    VStack{
        CustomNavBarView(current: .carbsView, goToRecipe: $goToRecipe)
            .environmentObject(viewModel)
        Spacer()
    }
}

