//
//  SongDetail.swift
//  music_game
//
//  Created by Jeanne Charoy on 22/09/2023.
//

import SwiftUI

struct SongDetail: View {
    @EnvironmentObject var modelData: ModelData
    var song: Song
    //var playlist: Playlist
    
    var songIndex: Int {
        modelData.playlists[0].songs.firstIndex(where: {$0.id == song.id})!
    }
    
//    var playlistIndex: Int {
//        modelData.playlists.firstIndex(where: {$0.id == playlist.id})!
//    }
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                HStack{
                    Text(song.title)
                        .font(.title)
                    
                    PlayedButton(isSet: $modelData.playlists[0].songs[songIndex].isAvailable)
                    
                }
                Text(song.artist)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Divider()
                HStack{
                    Text(song.lyrics)
                }
            }
            .padding()
        }
        .navigationTitle(song.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SongDetail_Previews: PreviewProvider {
    static var playlists = ModelData().playlists
    static let modelData = ModelData()
    
    static var previews: some View {
//        SongDetail(song: playlists[0].songs[0], playlist: playlists[0])
        SongDetail(song:playlists[0].songs[0])
                .environmentObject(modelData)
    }
}
