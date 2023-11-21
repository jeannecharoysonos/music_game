//
//  QuizStart.swift
//  music_game
//
//  Created by Jeanne Charoy on 25/09/2023.
//

// TODO: add a reset button to refresh the playlists

import SwiftUI

struct QuizStart: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 10){
                Text("QUIZ TEAM")
                    .bold()
                    .font(.title)
                
                Spacer()
                    .frame(height: 50)
                Text("Your role is to play songs, stop them when you want, and have the other team guess the lyrics!")
                Spacer()
                    .frame(height: 10)
                Text("To play and stop songs, you must ask the Sonos speaker using voice")
                
                Text("There is no need for a wakeword, just ask Sonos to play or stop music as you would a person!")
                
                Spacer()
                    .frame(height: 10)
                Text("Go to the next screen to get a list of four playlists, and ask the other team which one they want")
                
              
                    NavigationLink(destination: PlaylistList()) {
                        Text("Go To Playlists")
                }
            }
       }
        .navigationViewStyle(.stack)

    }
}

struct QuizStart_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        QuizStart()
            .environmentObject(ModelData())
    }
}
