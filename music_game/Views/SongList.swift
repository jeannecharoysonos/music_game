//
//  SongList.swift
//  music_game
//
//  Created by Jeanne Charoy on 22/09/2023.
//

import SwiftUI

struct SongList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showAvailableOnly = true
    //@Binding var userIndex: Int
    
    var playlist: Playlist
    var user: User

    var playlistIndex:Int{
        modelData.playlists.firstIndex(where: {$0.id == playlist.id})!
    }

   var filteredSongs: [Song] {
       modelData.playlists[playlistIndex].songs.filter {song in
           (!showAvailableOnly ||
            song.isAvailable)
        }
    }

    var body: some View {
        NavigationStack{
            List{
                Section {
                    PlaylistDoneButton(isPlayable: $modelData.playlists[playlistIndex].isPlayable)
                } header: { Text("") }
                
                Section {
                    ForEach(filteredSongs){
                        song in NavigationLink {
                            SongDetail(playlist:playlist,song:song, user:user)
                            } label: {
                                SongRow(song: song)
                            }
                        }
                } header: { Text("Songs") }
                
                Section {
                    Toggle(isOn: $showAvailableOnly) {
                        Text("Available songs only")
                            .foregroundColor(.gray)
                    }
                } header: { Text("Display option") }
   
            }

        }
       // .navigationViewStyle(.stack)
        .navigationTitle("Songs")
        .navigationBarBackButtonHidden(false)

    }
}


struct SongList_Previews: PreviewProvider {
    static var previews: some View {
        SongList(playlist: ModelData().playlists[1],
                 user: ModelData().users[0])
            .environmentObject(ModelData())
    }
}
