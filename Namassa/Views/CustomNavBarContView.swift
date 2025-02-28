//
//  CustomNavBarContView.swift
//  Namassa
//
//  Created by found on 21/02/25.
//

import SwiftUI

struct CustomNavBarContView: View {
//    var backAction: (() -> Void)?
    
//    init(@ViewBuilder content: () -> Content, backAction: (() -> Void)? = nil) {
//        self.content = content()
//        self.backAction = backAction
//    }
    @EnvironmentObject var viewModel: ViewModel
    @State var currentView = CurrentView.carbsView
    @State var goToRecipe = false
    
    func backAction() {
        currentView = CurrentView(rawValue: currentView.rawValue - 1) ?? currentView
    }
    func nextAction() {
        print(currentView.rawValue)
        if currentView.rawValue == 3 {
            goToRecipe.toggle()
        } else {
            currentView = CurrentView(rawValue: currentView.rawValue + 1) ?? currentView
        }
    }
    
    var body: some View {
        NavigationStack {
            CustomNavBarView(current: currentView, voltar: backAction, prox: nextAction, goToRecipe: $goToRecipe)
//            CarbsView()
//                .frame(width: 100, height: 100)
            VStack{
                currentView.getView()
            }.navigationDestination(isPresented: $goToRecipe) {
                RecipeListView()
            }
        }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

enum CurrentView: Int, CaseIterable {
    case carbsView = 1
    case proteinView = 2
    case veggieView = 3
    
    @ViewBuilder
    func getView() -> some View {
        switch self {
        case .carbsView:
            CarbsView()
        case .proteinView:
            ProteinView()
        case .veggieView:
            VeggiesView()
        }
    }
    
}

#Preview {
    @Previewable @StateObject var viewModel = ViewModel()
    CustomNavBarContView()
        .environmentObject(viewModel)
}
