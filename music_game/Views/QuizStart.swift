//
//  QuizStart.swift
//  music_game
//
//  Created by Jeanne Charoy on 25/09/2023.
//

import SwiftUI

struct QuizStart: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("You're the quiz team!")
                    NavigationLink(destination: PlaylistList()) {
                        Text("Go To Next Step")
                }
            }
        }
    }
}

struct QuizStart_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        QuizStart()
            .environmentObject(ModelData())
    }
}
