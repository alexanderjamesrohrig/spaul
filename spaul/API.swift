//
//  API.swift
//  spaul
//
//  Created by Alexander Rohrig on 4/30/23.
//

import Foundation
import SwiftUI

struct TeamNameFormat {
    let id: Int
    let name: String
}

class MlbApi: ObservableObject {
    //@Published var standingsComplete: Standings //= Standings(id: UUID(), copyright: "", records: [Standings.Record])
    @Published var standings: [Standings.Record.TeamRecord] = []
    @Published var copyright: String = ""
    
    let copyrightText = "The accounts, descriptions, data and presentation in the referring page (the \"Materials\") are proprietary content of MLB Advanced Media, L.P (\"MLBAM\").\nOnly individual, non-commercial, non-bulk use of the Materials is permitted and any other use of the Materials is prohibited without prior written authorization from MLBAM.\nAuthorized users of the Materials are prohibited from using the Materials in any commercial manner other than as expressly authorized by MLBAM."
    
    let teamNames = [TeamNameFormat(id: 117, name: "Houston"),
                     TeamNameFormat(id: 140, name: "Texas"),
                     TeamNameFormat(id: 133, name: "Oakland"),
                     TeamNameFormat(id: 136, name: "Seattle"),
                     TeamNameFormat(id: 108, name: "Los Angeles"),]
    
//    init() {
//        let recordDefault = TeamRecord(team: <#T##Team#>, season: "nil", streak: <#T##Streak#>, divisionRank: "nil", leagueRank: "nil", sportRank: "nil", gamesPlayed: 0, gamesBack: "nil", wildCardGamesBack: "nil", leagueGamesBack: "nil", springLeagueGamesBack: <#T##EGamesBack#>, sportGamesBack: <#T##String#>, divisionGamesBack: <#T##String#>, conferenceGamesBack: <#T##EGamesBack#>, leagueRecord: <#T##LeagueRecordElement#>, lastUpdated: <#T##Date#>, records: <#T##Records#>, runsAllowed: <#T##Int#>, runsScored: <#T##Int#>, divisionChamp: <#T##Bool#>, divisionLeader: <#T##Bool#>, hasWildcard: <#T##Bool#>, clinched: <#T##Bool#>, eliminationNumber: <#T##String#>, wildCardEliminationNumber: <#T##String#>, magicNumber: <#T##String?#>, wins: <#T##Int#>, losses: <#T##Int#>, runDifferential: <#T##Int#>, winningPercentage: <#T##String#>, wildCardRank: <#T##String?#>, wildCardLeader: <#T##Bool?#>)
//        let divisionDefault = Division(id: 000, link: "nil")
//        let recordsDefault = Record(standingsType: "nil", league: divisionDefault, division: divisionDefault, sport: divisionDefault, lastUpdated: "nil", teamRecords: <#T##[TeamRecord]#>)
//        let standingsCompleteDefault = Standings(copyright: <#T##String#>, records: <#T##[Record]#>)
//        standingsComplete = Standings(id: UUID(), copyright: "", records: [recordI])
//    }
    
    func getSpecialMark(fromTeam: Standings.Record.TeamRecord) -> String {
        if fromTeam.clinched {
            return "X"
        }
        else if fromTeam.divisionChamp {
            return "♔"
        }
        else {
            return ""
        }
    }
    
    func getStandings() {
        guard var url = URL(string: "https://statsapi.mlb.com/api/v1/standings") else { fatalError("url error") }
        url.append(queryItems: [URLQueryItem(name: "leagueId", value: "103"),
                                URLQueryItem(name: "division", value: "200"),
                                URLQueryItem(name: "season", value: "2023")])
        let urlRequest = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("request error")
                print(error)
            }
            guard let response = response as? HTTPURLResponse else { return }
            print(response)
            if response.statusCode == 200 {
                // success
                guard let data = data else { return }
                print(String(data: data, encoding: .ascii))
                DispatchQueue.main.async {
                    do {
//                        let decoded = try? JSONDecoder().decode(Standings.self, from: data)
//                        let standings = try? JSONDecoder().decode(Standings.self, from: data)
                        let decoded = try JSONDecoder().decode(Standings.self, from: data)
//                        self.standingsComplete = decoded
                        self.copyright = decoded.copyright
                        print(decoded)
                        for x in decoded.records {
                            if x.division.id == 200 {
                                self.standings = x.teamRecords
                            }
                        }
                    }
                    catch {
                        print("decoding error")
                    }
                }
            }
        }
        dataTask.resume()
    }
    
}
