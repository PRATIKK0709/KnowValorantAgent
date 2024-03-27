import SwiftUI

struct ContentView: View {
    @State private var agentUUIDs: [String] = []
    @State private var agentDetails: [AgentData?] = []
    @State private var selectedAgent: AgentData? = nil
    
    var body: some View {
        NavigationView {
            ScrollView {
                if let selectedAgent = selectedAgent {
                    AgentDetailView(agentData: selectedAgent, didSelectBack: {
                        withAnimation {
                            self.selectedAgent = nil
                        }
                    })
                    .transition(.opacity)
                } else {
                    AgentGridView(agentDetails: agentDetails, agentSelected: { agent in
                        withAnimation {
                            self.selectedAgent = agent
                        }
                    })
                    .padding()
                    .transition(.scale)
                }
            }
            .navigationBarTitle(selectedAgent == nil ? "Agents" : selectedAgent!.displayName)
        }
        .onAppear {
            fetchAgentUUIDs()
        }
    }
    
    private func fetchAgentUUIDs() {
        guard let url = URL(string: "https://valorant-api.com/v1/agents") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let response = try? JSONDecoder().decode(AgentUUIDsResponse.self, from: data) {
                DispatchQueue.main.async {
                    self.agentUUIDs = response.data.compactMap { $0.uuid }
                    fetchAgentDetails()
                }
            }
        }.resume()
    }
    
    private func fetchAgentDetails() {
        for uuid in agentUUIDs {
            guard let url = URL(string: "https://valorant-api.com/v1/agents/\(uuid)") else { continue }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    print("Error: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                
                if let response = try? JSONDecoder().decode(AgentDetailResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.agentDetails.append(response.data)
                    }
                }
            }.resume()
        }
    }
}

