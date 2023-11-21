//
//  SongDetail.swift
//  music_game
//
//  Created by Jeanne Charoy on 22/09/2023.
//
//add a guess button that controls the timer

import SwiftUI

struct SongDetail: View {
    @EnvironmentObject var modelData: ModelData
    //@Binding var userIndex: Int
    var playlist: Playlist
    var song: Song
    var user: User

    var userIndex:Int{
        modelData.users.firstIndex(where: {$0.userIndex == user.userIndex})!
    }
    
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
                   CorrectButton(isAvailable: $modelData.playlists[playlistIndex].songs[songIndex].isAvailable,
                                 count:$modelData.users[userIndex].score,
                                 time:$modelData.users[userIndex].timeRemaining)
    
                    
                    WrongButton(isWrong: $modelData.playlists[playlistIndex].songs[songIndex].isWrong,
                                isAvailable: $modelData.playlists[playlistIndex].songs[songIndex].isAvailable)
                    
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
        .navigationViewStyle(.stack)

    }

}

struct SongDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        SongDetail(playlist:modelData.playlists[0],
            song:modelData.playlists[0].songs[0],
                   user:modelData.users[0])
                .environmentObject(modelData)
    }
}
