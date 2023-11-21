//
//  ModelData.swift
//  music_game
//
//  Created by Jeanne Charoy on 22/09/2023.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    //@Published var songs: [Song] = load("gameData.json")
    
    @Published var playlists: [Playlist] = load("gameData.json")
    @Published var users = [User(teamName: "Team A",userIndex: 0, score: 0, roundNb: 0, timeRemaining: 60),
                            User(teamName: "Team B",userIndex: 1, score: 0, roundNb: 0, timeRemaining: 60)]


}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
        print(data)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}



