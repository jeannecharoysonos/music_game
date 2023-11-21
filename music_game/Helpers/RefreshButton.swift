//
//  RefreshButton.swift
//  music_game
//
//  Created by Jeanne Charoy on 16/11/2023.
//

import Foundation

import SwiftUI

struct RefreshButton: View {
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


struct RefreshButton_Previews: PreviewProvider {
    
    static var previews: some View {
        RefreshButton(isCorrect: .constant(false),
                      isAvailable: .constant(false))

    }
}
