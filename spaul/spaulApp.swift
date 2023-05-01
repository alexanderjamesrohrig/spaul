//
//  spaulApp.swift
//  spaul
//
//  Created by Alexander Rohrig on 4/30/23.
//

import SwiftUI

//struct StandingTest: Identifiable {
//    let winCount: Int
//    let name: String
//    let lossCount: Int
//    let winPercent : Float
//    let logoName: String
//    let id: Int
//}

@main
struct spaulApp: App {
    
    var api = MlbApi()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(api)
        }
    }
}
