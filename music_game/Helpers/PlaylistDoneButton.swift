//
//  PlaylistDoneButton.swift
//  music_game
//
//  Created by Jeanne Charoy on 16/11/2023.
//

import Foundation

import SwiftUI

struct PlaylistDoneButton: View {
    @Binding var isPlayable: Bool
    
    var body: some View {
        
        let done: () -> Void = {
            isPlayable = false
        }
        
        Button("Done with this playlist", action: done)
            .tint(isPlayable ? .blue : .red)
            //.opacity(isAvailable ? 1 : 0.5)
    }
}


struct PlaylistDoneButton_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistDoneButton(isPlayable: .constant(true))
    }
}
