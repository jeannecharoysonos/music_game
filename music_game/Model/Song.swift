//
//  Song.swift
//  music_game
//
//  Created by Jeanne Charoy on 22/09/2023.
//

import Foundation
import SwiftUI



struct Playlist: Decodable, Identifiable {
    var playlist: String
    var id: Int
    var songs: [Song]
    var isPlayable: Bool

}

struct Song: Codable, Identifiable, Hashable{
    var title: String
    var artist: String
    var id: Int
    //var isErrorSong: Bool
    var lyrics: String
    var isAvailable: Bool
    var isCorrect: Bool
    var isWrong: Bool
    
}

