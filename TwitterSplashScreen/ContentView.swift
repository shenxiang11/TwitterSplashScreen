//
//  ContentView.swift
//  TwitterSplashScreen
//
//  Created by 香饽饽zizizi on 2024/2/8.
//

import SwiftUI

struct ContentView: View {
    @State private var isShown = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(1...100, id: \.self) { _ in
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(.gray.opacity(0.3))
                        .frame(height: 100)
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay {
            if !isShown {
                Color.bg
                    .mask {
                        Color.bg
                            .overlay {
                                Image(.logo)
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .blendMode(.destinationOut)
                            }
                    }
                    .ignoresSafeArea()
                    .transition(.scale(scale: 40).animation(.easeInOut(duration: 1)))
            }
        }
        .onAppear {
            isShown = true
        }
    }
}

#Preview {
    ContentView()
}
