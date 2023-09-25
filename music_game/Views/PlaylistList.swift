//
//  PlaylistList.swift
//  music_game
//
//  Created by Jeanne Charoy on 22/09/2023.
//

import SwiftUI

struct PlaylistList: View {
    @EnvironmentObject var modelData: ModelData
    
    
    var body: some View {
        NavigationView {
            List(modelData.playlists){playlist in
                NavigationLink {
                    SongList(playlist: playlist)
                } label: {
                    PlaylistRow(playlist: playlist)
                }
            }
            .navigationTitle("Playlist")
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
