//
//  SplashScreenView.swift
//  Namassa
//
//  Created by found on 21/01/25.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.7
    @State private var opacity = 0.6
    
    var body: some View {
        if isActive {
            LoginView()
        } else {
            VStack{
                VStack{
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(Color(hex: "#FF2201"))
                    Text("Namassa")
                        .font(.system(size: 23))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.95
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
