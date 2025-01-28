//
//  ContentView.swift
//  Namassa
//
//  Created by found on 14/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tabSelection = 1
    var body: some View {
        
        TabView(selection: $tabSelection) {
            HomeView().tag(1)
            SearchToolView().tag(2)
            FavoritesView().tag(3)
            ProfileView().tag(4)
            
        }
        .overlay(alignment: .bottom){
          CustomBarView(tabSelection: $tabSelection)
       }
    }
}

#Preview {
    ContentView()
}
