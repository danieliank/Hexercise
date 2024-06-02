//
//  ContentView.swift
//  Hexercise Watch App
//
//  Created by Daniel Ian on 31/05/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var heartRateManager = HeartRateManager()
    @State private var gameOver = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(String(format: "%.0f", heartRateManager.heartRate))").padding()
                ForEach(0..<2) { row in
                    HStack {
                        ForEach(0..<5) { col in
                            let index = row * 5 + col
                            if index < heartRateManager.health {
                                Image(systemName: "heart.fill")
                            } else {
                                Image(systemName: "heart")
                            }
                        }
                    }
                }
                NavigationLink(destination: GameOverView().navigationBarBackButtonHidden(true), isActive: $gameOver) {
                }
                .buttonStyle(PlainButtonStyle())
            }
            .onChange(of: heartRateManager.heartRate) { newValue in
                heartRateManager.handleHeartRateChange(heartRate: newValue)
            }
            .onChange(of: heartRateManager.health) { newValue in
                if newValue <= 0 {
                    gameOver = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
