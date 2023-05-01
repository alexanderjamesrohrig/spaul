//
//  Standings.swift
//  spaul
//
//  Created by Alexander Rohrig on 4/30/23.
//

import Foundation

struct Standings: Identifiable, Decodable {
    var id: UUID?
    var copyright: String
    var records: [Record]

    struct Record: Identifiable, Decodable {
        var id: UUID?
        var division: Division
        var lastUpdated: String
        var teamRecords: [TeamRecord]

        struct Division: Decodable {
            var id: Int
        }

        struct TeamRecord: Identifiable, Decodable {
            var id: UUID?
            var team: Team
            var divisionRank: String
            var runsAllowed: Int
            var runsScored: Int
            var divisionChamp: Bool
            var clinched: Bool
            var wins: Int
            var losses: Int
            var runDifferential: Int
            var winningPercentage: String
        }
    }
}

struct Team: Decodable {
    var id: Int
    var name: String
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let standings = try? JSONDecoder().decode(Standings.self, from: jsonData)

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let standings = try? JSONDecoder().decode(Standings.self, from: jsonData)

//import Foundation
//
//// MARK: - Standings
//struct Standings: Codable {
//    let copyright: String?
//    let records: [Record]
//}
//
//// MARK: - Record
//struct Record: Codable {
//    let standingsType: String?
//    let league, division, sport: Division?
//    let lastUpdated: String?
//    let teamRecords: [TeamRecord]?
//}
//
//// MARK: - Division
//struct Division: Codable {
//    let id: Int?
//    let link: String?
//}
//
//// MARK: - TeamRecord
//struct TeamRecord: Codable {
//    let team: Team
//    let season: String?
//    let streak: Streak?
//    let divisionRank, leagueRank, sportRank: String?
//    let gamesPlayed: Int?
//    let gamesBack, wildCardGamesBack, leagueGamesBack: String?
//    let springLeagueGamesBack: EGamesBack?
//    let sportGamesBack, divisionGamesBack: String?
//    let conferenceGamesBack: EGamesBack?
//    let leagueRecord: LeagueRecordElement?
//    let lastUpdated: Date?
//    let records: Records?
//    let runsAllowed, runsScored: Int
//    let divisionChamp, divisionLeader, hasWildcard, clinched: Bool?
//    let eliminationNumber, wildCardEliminationNumber, magicNumber: String?
//    let wins, losses, runDifferential: Int
//    let winningPercentage, wildCardRank: String?
//    let wildCardLeader: Bool?
//}
//
//enum EGamesBack: String, Codable {
//    case empty = "-"
//}
//
//// MARK: - LeagueRecordElement
//struct LeagueRecordElement: Codable {
//    let wins, losses, ties: Int?
//    let pct: String?
//    let division: Team?
//    let type: String?
//    let league: Team?
//}
//
//// MARK: - Team
//struct Team: Codable {
//    let id: Int
//    let name: String
//    let link: String?
//}
//
//// MARK: - Records
//struct Records: Codable {
//    let splitRecords, divisionRecords, overallRecords, leagueRecords: [LeagueRecordElement]?
//    let expectedRecords: [LeagueRecordElement]?
//}
//
//// MARK: - Streak
//struct Streak: Codable {
//    let streakType: StreakType?
//    let streakNumber: Int?
//    let streakCode: String?
//}
//
//enum StreakType: String, Codable {
//    case losses = "losses"
//    case wins = "wins"
//}
