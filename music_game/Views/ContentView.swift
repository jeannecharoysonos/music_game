//
//  ContentView.swift
//  music_game
//
//  Created by Jeanne Charoy on 15/09/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var userIndex: Int
    @Binding var otherUserIndex: Int


    var body: some View {
        NavigationView {
            VStack(spacing: 10){
                Text("Hi " + modelData.users[userIndex].teamName)
                    .bold()
                    .font(.title)
                Text("You're the quiz team")
                    .bold()
                    .font(.title)
                
                
                Spacer()
                    .frame(height: 50)
                Text("Your role is to play songs, stop them when you want, and have " + modelData.users[otherUserIndex].teamName +  " guess the lyrics!")
                Spacer()
                    .frame(height: 10)
                Text("To play and stop songs, you must ask the Sonos speaker using voice")
                
                Spacer()
                    .frame(height: 10)
                
                Text("There is no need for a wakeword, just ask Sonos to play or stop music as you would a person!")
                
                Spacer()
                    .frame(height: 10)
                Text("Go to the next screen to get a list of four playlists, and ask the other team which one they want")
                
                Spacer()
                    .frame(height: 50)
                    NavigationLink(destination: PlaylistList(user: modelData.users[userIndex])) {
                        Text("GO TO PLAYLISTS")
                }
            }
       }
        .navigationViewStyle(.stack)

    }
}

struct ContentView_Previews: PreviewProvider {    
    static var previews: some View {
        ContentView(userIndex: .constant(0),
                    otherUserIndex: .constant(1))
            .environmentObject(ModelData())
    }
}
