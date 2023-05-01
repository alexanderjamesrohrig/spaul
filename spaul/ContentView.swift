//
//  ContentView.swift
//  spaul
//
//  Created by Alexander Rohrig on 4/30/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var api: MlbApi
    @State private var updated: String = ""
    
    var body: some View {
        VStack {
            Grid() {
                Text("American League West")
                Divider()
                GridRow {
                    Text("")
                    Text("Wins")
                    Text("Losses")
                    Text("Runs Scored")
                    Text("Runs Allowed")
                    Text("Run Differential")
                    Text("Win Percent").bold()
                }
                ForEach(api.standings, id: \.team.id) { standing in
                    GridRow {
//                        Text(api.getSpecialMark(fromTeam: standing))
                        Text(standing.team.name)
                        Text(String(standing.wins))
                        Text(String(standing.losses))
                        Text(String(standing.runsScored))
                        Text(String(standing.runsAllowed))
                        Text(String(standing.runDifferential))
                        Text(standing.winningPercentage).bold()
                    }
                }
            }
            Spacer()
            Divider()
            HStack {
                Button("Refresh") {
                    api.getStandings()
                }
                //Text("Updated April 30, 2023")
                Spacer()
                Image("logoMlb")
                    .resizable()
                    .frame(width: 160.0, height: 86.5)
            }
        }.onAppear() {
            api.getStandings()
            UIApplication.shared.isIdleTimerDisabled = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MlbApi())
    }
}
