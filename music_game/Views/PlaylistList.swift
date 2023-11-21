//
//  PlaylistList.swift
//  music_game
//
//  Created by Jeanne Charoy on 22/09/2023.
//


import SwiftUI

struct PlaylistList: View {
    @EnvironmentObject var modelData: ModelData
    var user:User

    var userIndex:Int{
        modelData.users.firstIndex(where: {$0.userIndex != user.userIndex})!
    }
    
    var randomFilteredPlaylists: [Playlist] {
        var tempList: [Playlist] = []
        let filteredPlaylists:[Playlist] = modelData.playlists.filter{
            playlist in (playlist.isPlayable)
        }
        let shuffledPlaylists:[Playlist] = filteredPlaylists.shuffled()
        if(shuffledPlaylists.count > 4){
            for index in 0...3{
                tempList.append(shuffledPlaylists[index])
            }
        }
        else{
            for index in 0...(shuffledPlaylists.count - 1){
                tempList.append(shuffledPlaylists[index])
            }
        }

        return tempList
    }
    

    
    var body: some View {
        
        ZStack{
            HStack{
                VStack{
                    Score(userIndex: $modelData.users[userIndex].userIndex)
                }.padding(30)

                Spacer()
                VStack{
                    TimerView(userIndex: $modelData.users[userIndex].userIndex)
                }.padding(30)
            }
        }
        
        NavigationStack{
                List(){
                    Section{
                        ForEach(randomFilteredPlaylists){
                            playlist in
                            NavigationLink {
                                SongList(playlist: playlist,
                                user: modelData.users[userIndex])
                            } label: {
                                PlaylistRow(playlist: playlist)
                            }
                        }
                    }header: { Text("") }
                    
                }.navigationTitle("Playlists")
                
            }
            .refreshable{}
            .navigationBarBackButtonHidden(true)
//            .navigationViewStyle(.stack)

    }

}



struct PlaylistList_Previews: PreviewProvider {
   // static let modelData = ModelData()
    
    static var previews: some View {
        PlaylistList(user: ModelData().users[0])
            .environmentObject(ModelData())
    }
}
