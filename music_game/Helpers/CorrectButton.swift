//
//  PlayedButton.swift
//  music_game
//
//  Created by Jeanne Charoy on 22/09/2023.
//

import SwiftUI

struct CorrectButton: View {
    @Binding var isCorrect: Bool
    @Binding var isAvailable: Bool
    
    var body: some View {
        
        let action: () -> Void = {
            isCorrect = true
            isAvailable = false
        }
        
        Button("Correct",action: action)
            .buttonStyle(.borderedProminent)
            .tint(isCorrect ? .green : .blue)
           // .opacity(isAvailable ? 1 : 0.5)
            .disabled(isAvailable ? false: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)

    }
}


struct CorrectButton_Previews: PreviewProvider {
    
    static var previews: some View {
        CorrectButton(isCorrect: .constant(false), 
                      isAvailable: .constant(false))

    }
}
