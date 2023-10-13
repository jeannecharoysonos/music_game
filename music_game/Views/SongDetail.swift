//
//  SongDetail.swift
//  music_game
//
//  Created by Jeanne Charoy on 22/09/2023.
//

import SwiftUI

struct SongDetail: View {
    @EnvironmentObject var modelData: ModelData
    var playlist: Playlist
    var song: Song
    
    var playlistIndex:Int{
        modelData.playlists.firstIndex(where: {$0.id == playlist.id})!
    }
    
    var songIndex: Int {
       modelData.playlists[playlistIndex].songs.firstIndex(where: {$0.id == song.id})!
    }
    
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                HStack{
                    Text(song.title)
                        .font(.title)
                }
                Text(song.artist)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Divider()
                HStack{
                    Text(song.lyrics)
                }
                
                Divider()
                HStack{
                    CorrectButton(isCorrect: $modelData.playlists[playlistIndex].songs[songIndex].isCorrect,
                                  isAvailable: $modelData.playlists[playlistIndex].songs[songIndex].isAvailable)
                    
                Divider()
                    WrongButton(isWrong: $modelData.playlists[playlistIndex].songs[songIndex].isWrong,
                                isAvailable: $modelData.playlists[playlistIndex].songs[songIndex].isAvailable)
                    
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
        SongDetail(
            playlist:playlists[0],
            song:playlists[0].songs[0]
                  )
                .environmentObject(modelData)
    }
}
