//
//  PlaylistList.swift
//  music_game
//
//  Created by Jeanne Charoy on 22/09/2023.
//

import SwiftUI

struct PlaylistList: View {
    @EnvironmentObject var modelData: ModelData
    
    var randomPlaylists: [Playlist] {
        var tempList: [Playlist] = []
        let shuffledPlaylists:[Playlist] = modelData.playlists.shuffled()
        for index in 0...3 {
            tempList.append(shuffledPlaylists[index])
        }
        return tempList
    }
    
    var body: some View {
        NavigationView {
            List(randomPlaylists){playlist in
                NavigationLink {
                    SongList(playlist: playlist)
                } label: {
                    PlaylistRow(playlist: playlist)
                }
            }
            .navigationTitle("Playlists")
        }.navigationViewStyle(StackNavigationViewStyle())
                    
    }
}


struct PlaylistList_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        PlaylistList()
            .environmentObject(ModelData())
    }
}
