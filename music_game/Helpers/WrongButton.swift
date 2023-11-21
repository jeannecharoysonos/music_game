//
//  PlayedButton.swift
//  music_game
//
//  Created by Jeanne Charoy on 22/09/2023.
//

import SwiftUI

struct WrongButton: View {
    @Binding var isWrong: Bool
    @Binding var isAvailable: Bool
    
    var body: some View {
        
        let wrong: () -> Void = {
            isWrong = true
            isAvailable = false
        }
        
        Button("Wrong!",action: wrong)
        .buttonStyle(.borderedProminent)
        .tint(isWrong ? .red : .orange)
        //.opacity(isAvailable ? 1 : 0.5)
        .disabled(isAvailable ? false: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
    }
}


struct WrongButton_Previews: PreviewProvider {
    static var previews: some View {
        WrongButton(isWrong: .constant(false),
                    isAvailable: .constant(true))
    }
}
