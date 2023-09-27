//
//  SongRow.swift
//  music_game
//
//  Created by Jeanne Charoy on 22/09/2023.
//

import SwiftUI

struct SongRow: View {
    @EnvironmentObject var modelData: ModelData
    var song: Song
    
    var body: some View {
        HStack{
            if song.isAvailable {
                Text(song.title)
            }else{
                Text(song.title)
                    .foregroundStyle(.gray)
            }

        }
    }
}


struct SongRow_Previews: PreviewProvider {
    static var playlists = ModelData().playlists
    
    static var previews: some View {
        Group{
            SongRow(song: playlists[0].songs[0])
            SongRow(song: playlists[0].songs[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
