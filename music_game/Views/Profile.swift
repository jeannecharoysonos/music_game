//
//  Score.swift
//  music_game
//
//  Created by Jeanne on 12/10/2023.
//

import SwiftUI

struct Profile: View {
    @EnvironmentObject var modelData: ModelData
    var user: User
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(user.teamName)
                    .bold()
                    .font(.title)
                
                Text("Round as quizzers: \(user.roundNb)")
                
                
                Divider()
            }
            .padding()
        }
    }
}
        

#Preview {
    Profile(user: User.default)
        .environmentObject(ModelData())
}
