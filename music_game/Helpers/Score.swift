//
//  Score.swift
//  music_game
//
//  Created by Jeanne Charoy on 21/11/2023.
//

import SwiftUI

struct Score: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var userIndex: Int

    
    var body: some View {
        VStack(spacing: 20){
            Text(String(modelData.users[userIndex].score))
                .font(.largeTitle)
                .frame(width: 100, height: 100, alignment: .center)
                .padding()
                .overlay(
                    Circle()
                        .stroke(Color.purple, lineWidth: 4)
                        .padding(2)
                )
            
            Text(modelData.users[userIndex].teamName + " Score")
                .foregroundColor(.purple)
                .font(.system(size: 20))
        }
    }
}


struct Score_Previews: PreviewProvider {
    static var previews: some View {
        Score(userIndex: .constant(0))
            .environmentObject(ModelData())
    }
}
