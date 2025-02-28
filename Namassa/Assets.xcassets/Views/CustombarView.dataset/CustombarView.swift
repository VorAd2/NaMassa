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
        ("magnifyingglass", ""),
        ("heart", ""),
    ]
    var body: some View {
        VStack(spacing: 0.0){
    
            HStack(spacing: 160){
                ForEach(0..<2){ index in
                    Button {
                        tabSelection = index + 1
                    }label: {
                        VStack(spacing: 5){
                            Image(systemName: tabBarItems[index].image).resizable()
                                .scaledToFit()
                        }
                    }
                    .foregroundColor(index + 1 == tabSelection ? .red : .gray)
                }
            }.frame(height:30)
                
            
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
