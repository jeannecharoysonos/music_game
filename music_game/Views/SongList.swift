//
//  SongList.swift
//  music_game
//
//  Created by Jeanne Charoy on 22/09/2023.
//

import SwiftUI

struct SongList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showAvailableOnly = false

    var playlist: Playlist

   var filteredSongs: [Song] {
       playlist.songs.filter {song in
           (!showAvailableOnly || song.isAvailable)
        }
    }

    var body: some View {
        NavigationView {
            List{
                Toggle(isOn: $showAvailableOnly) {
                    Text("Available only")
                }
                ForEach(filteredSongs) { song in
                        NavigationLink {
                            SongDetail(song:song)
                        } label: {
                            SongRow(song: song)
                        }
                    }
                }
            }.navigationViewStyle(StackNavigationViewStyle())
    .navigationTitle("Songs")
    }
}


struct SongList_Previews: PreviewProvider {
    static var playlists = ModelData().playlists

    static var previews: some View {
        SongList(playlist: playlists[0])
    }
}
