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
            VStack(spacing: 10){
                Text("You're the quiz team!")
                    .bold()
                    .font(.title)
                
                Divider()
            
                Text("Your role is to play songs, stop them at a random point, and ask the other team to guess the lyrics!")

                Divider()
                Text("Go to the next screen to get a list of four playlists, and ask the other team which one they want")
                
                Divider()
                    NavigationLink(destination: PlaylistList()) {
                        Text("Go To Playlists")
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
