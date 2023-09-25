//
//  PlaylistRow.swift
//  music_game
//
//  Created by Jeanne Charoy on 22/09/2023.
//

import SwiftUI

struct PlaylistRow: View {
    var playlist: Playlist
    
    var body: some View {
        HStack{
            Text(playlist.playlist)
            Spacer()
        }
        .padding()
    }
}

struct PlaylistRow_Previews: PreviewProvider {
    static var playlists = ModelData().playlists
    
    static var previews: some View {
        Group{
          PlaylistRow(playlist: playlists[0])
            PlaylistRow(playlist: playlists[1])
        }
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
