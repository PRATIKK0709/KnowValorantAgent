//
//  Agent.swift
//  KnowValorantAgents
//
//  Created by Pratik Ray on 22/09/23.
//

import SwiftUI

struct AgentUUIDsResponse: Codable {
    let status: Int
    let data: [AgentUUIDData]
}

struct AgentUUIDData: Codable {
    let uuid: String
}

struct AgentDetailResponse: Codable {
    let status: Int
    let data: AgentData
}

struct AgentData: Codable {
    let uuid: String
    let displayName: String
    let description: String
    let displayIconSmall: String
    let abilities: [Ability]
}



struct Ability: Codable, Hashable {
    let slot: String
    let displayName: String
    let description: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
