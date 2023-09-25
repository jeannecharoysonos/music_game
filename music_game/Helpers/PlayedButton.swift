//
//  PlayedButton.swift
//  music_game
//
//  Created by Jeanne Charoy on 22/09/2023.
//

import SwiftUI

struct PlayedButton: View {
    @Binding var isSet: Bool
    
    
    var body: some View {
        Button{
            isSet.toggle()
            } label: {
                Label("Toggle Favorite", systemImage: isSet ? "circle.fill" : "circle")
                    .labelStyle(.iconOnly)
                    .foregroundColor(isSet ? .green : .red)
            }
        }
}


struct PlayedButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayedButton(isSet: .constant(true))
    }
}
