//
//  TeamAButton.swift
//  music_game
//
//  Created by Jeanne Charoy on 21/11/2023.
//

import SwiftUI

struct TeamAButton: View {
    @Binding var userIndex: Int

    
    var body: some View {
        
        let action: () -> Void = {
            userIndex = 0
        }
        
        Button("TEAM A",action: action)
            .buttonStyle(.borderedProminent)
    }
}

struct TeamAButton_Previews: PreviewProvider {
    
    static var previews: some View {
        TeamAButton(userIndex:.constant(0))

    }
}




