import Foundation

struct User {
    var teamName: String
    var userIndex: Int
    var score: Int
    var roundNb: Int
    var timeRemaining: Int
    
    static let `default` = User(teamName: "Team", userIndex: 0, score: 0, roundNb: 0, timeRemaining: 60)

}
