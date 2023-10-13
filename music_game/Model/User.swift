import Foundation

struct User {
    var teamName: String
    var score: Int
    var roundNb: Int
    
    static let `default` = User(teamName: "Team A", score: 0, roundNb: 0)

}
