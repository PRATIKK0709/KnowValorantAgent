//
//  AgentGridView.swift
//  KnowValorantAgents
//
//  Created by Pratik Ray on 22/09/23.
//

import SwiftUI

struct AgentGridView: View {
    let agentDetails: [AgentData?]
    let agentSelected: (AgentData) -> Void
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 20) {
            ForEach(agentDetails.compactMap { $0 }, id: \.uuid) { agent in
                Button(action: {
                    agentSelected(agent)
                }) {
                    VStack {
                        AsyncImageView(url: URL(string: agent.displayIconSmall))
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.blue)
                            .frame(width: 100, height: 100)
                            .padding()
                        Text(agent.displayName)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .background(Color.clear)
                .cornerRadius(10)
                .shadow(radius: 5)
            }
        }
        .padding()
    }
}
