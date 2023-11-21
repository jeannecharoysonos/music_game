//
//  Lyrics.swift
//  music_game
//
//  Created by Jeanne Charoy on 20/10/2023.
//

import SwiftUI

struct Lyrics: View {
    @EnvironmentObject var modelData: ModelData
    var playlist: Playlist
    var song: Song
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(song.title)
                    .font(.title)
            }
            Text(song.artist)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Divider()
            Text(song.lyrics)
        }
    }
}

struct Lyrics_Preview: PreviewProvider  {
    static var playlists = ModelData().playlists
    static let modelData = ModelData()
    
    static var previews: some View {
        Lyrics(
            playlist:playlists[0],
            song:playlists[0].songs[0]
        )
        .environmentObject(modelData)
    }
}
