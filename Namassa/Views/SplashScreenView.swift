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
            FavoritesView()
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

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        let r, g, b: Double
        switch hex.count {
        case 6: // RRGGBB
            r = Double((int >> 16) & 0xFF) / 255.0
            g = Double((int >> 8) & 0xFF) / 255.0
            b = Double(int & 0xFF) / 255.0
        default:
            r = 1.0
            g = 1.0
            b = 1.0
        }
        
        self.init(red: r, green: g, blue: b)
    }
}
