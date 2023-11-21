//
//  TeamBCutton.swift
//  music_game
//
//  Created by Jeanne Charoy on 21/11/2023.
//

import SwiftUI

struct TeamBButton: View {
    @Binding var userIndex: Int

    
    var body: some View {
        
        let action: () -> Void = {
            userIndex = 1
        }
        
        Button("TEAM B",action: action)
            .buttonStyle(.borderedProminent)
    }
}

struct TeamBButton_Previews: PreviewProvider {
    
    static var previews: some View {
        TeamBButton(userIndex:.constant(1))

    }
}





