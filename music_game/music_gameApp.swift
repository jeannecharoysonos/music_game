//
//  music_gameApp.swift
//  music_game
//
//  Created by Jeanne Charoy on 15/09/2023.
//

import SwiftUI

@main
struct music_gameApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ProfileView()
                .environmentObject(modelData)
        }
    }
}
