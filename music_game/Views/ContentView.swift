//
//  ContentView.swift
//  music_game
//
//  Created by Jeanne Charoy on 15/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       QuizStart()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
