//
//  ProfileView.swift
//  music_game
//
//  Created by Jeanne Charoy on 21/11/2023.
//

import SwiftUI


struct ProfileView: View {
    @EnvironmentObject var modelData: ModelData
    
    @State var selection: Int? = nil
    
    @State private var userIndex: Int = 0 // Create the state.
    @State private var otherUserIndex: Int = 0 // Create the state.

    @State private var teamAPicked: Bool = false
    @State private var teamBPicked: Bool = false

    
    var body: some View {
  
        NavigationView{
            VStack{
                Text("Who's playing?")
                    .font(.title)
                
                Spacer()
                    .frame(height: 50)

                HStack{
                    Button("TEAM A"){
                        self.userIndex = 0
                        self.otherUserIndex = 1
                        self.teamAPicked = true
                        self.teamBPicked = false

                    }.font(.system(size: 20))
                        .disabled(teamAPicked)
                        .foregroundColor(teamAPicked ? Color.black : Color.gray)



                    
                    Spacer()
                        .frame(width: 40)
                    
                    Button("TEAM B"){
                        self.userIndex = 1
                        self.otherUserIndex = 0
                        self.teamAPicked = false
                        self.teamBPicked = true

                    }.font(.system(size: 20))
                        .disabled(teamBPicked)
                        .foregroundColor(teamBPicked ? Color.black : Color.gray)


                }
                
                Spacer()
                    .frame(height: 80)

                
                NavigationLink(destination:ContentView(userIndex: self.$userIndex, otherUserIndex: self.$otherUserIndex)){
                    Text("NEXT")
                        .font(.system(size: 20))
                }
            }
        }
        .navigationViewStyle(.stack)

        }
        

}

#Preview {
    ProfileView()
        .environmentObject(ModelData())

}

///HStack{
//}

