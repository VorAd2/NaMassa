//
//  TabView.swift
//  Namassa
//
//  Created by found on 24/01/25.
//

import SwiftUI

struct CustomBarView: View {
    @Binding var tabSelection: Int
    @Namespace private var animationNamespace
    
    let tabBarItems: [(image: String, title:String)] = [
        ("house", "Home"),
        ("magnifyingglass", "Search"),
        ("heart", "Favorites"),
        ("person", "Profile")
    ]
    var body: some View {
        VStack(spacing: 0.0){
    
            HStack(spacing: 40){
                ForEach(0..<4){ index in
                    Button {
                        tabSelection = index + 1
                    }label: {
                        VStack(spacing: 8){
                            Spacer()
                            
                            Image(systemName: tabBarItems[index].image)
                            
                            Text(tabBarItems[index].title)
                        }
                    }.foregroundColor(index + 1 == tabSelection ? .red : .gray)
                }
            }.frame(height:80)
                
            
        }
//        ZStack{
//            Capsule()
//                .frame(height:80)
//                .foregroundColor(Color(.secondarySystemBackground))
//                .shadow(radius:2)
//            
//            HStack{
//                ForEach(0..<4) { index in
//                    Button {
//                        tabSelection = index + 1
//                    }label: {
//                        VStack(spacing: 8){
//                            Spacer()
//
//                            Image(systemName: tabBarItems[index].image)
//                            
//                            Text(tabBarItems[index].title)
//                            
//                            if index + 1 == tabSelection {
//                                Capsule()
//                                    .frame(height: 8)
//                                    .foregroundColor(.red)
//                                    .matchedGeometryEffect(id: "SelectedTabId", in: animationNamespace)
//                                    .offset(y:3)
//                            } else {
//                                Capsule()
//                                    .frame(height: 8)
//                                    .foregroundColor(.clear)
//                                    .offset(y: 3)
//                            }
//                        }.foregroundColor(index + 1 == tabSelection ? .red : .gray)                    }
//                }
//            }.frame(height:80)
//                .clipShape(Capsule())
//        }.padding(.horizontal)
    }
}

#Preview {
    CustomBarView(tabSelection: .constant(1))
        .previewLayout(.sizeThatFits)
        .padding(.vertical)
}
