//
//  GameOverView.swift
//  Hexercise Watch App
//
//  Created by Daniel Ian on 02/06/24.
//

import SwiftUI

struct GameOverView: View {
    var body: some View {
        NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
            Image(systemName: "arrow.counterclockwise")
        }
        .buttonStyle(PlainButtonStyle())
        .onTapGesture {
            WKInterfaceDevice.current().play(.notification)
        }
    }
}

#Preview {
    GameOverView()
}
